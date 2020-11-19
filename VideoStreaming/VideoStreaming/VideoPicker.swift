//
//  VideoPicker.swift
//  VideoStreaming
//
//  Created by 박진수 on 2020/11/09.
//

import UIKit

protocol VideoPickerDelegate: class {
    func didSelect(url: URL)
}

class VideoPicker: NSObject {
    private let pickerController: UIImagePickerController
    private weak var presentationController: UIViewController?
    private weak var delegate: VideoPickerDelegate?
    
    public init(presentationController: UIViewController, delegate: VideoPickerDelegate) {
        self.pickerController = UIImagePickerController()
        super.init()
        
        self.presentationController = presentationController
        self.delegate = delegate
        
        self.pickerController.delegate = self
        self.pickerController.allowsEditing = true
        self.pickerController.mediaTypes = ["public.movie"]
        self.pickerController.videoQuality = .typeHigh
    }
    
    private func action(for type: UIImagePickerController.SourceType, title: String) -> UIAlertAction? {
        guard UIImagePickerController.isSourceTypeAvailable(type) else { return nil }
        
        return UIAlertAction(title: title, style: .default) { [unowned self] _ in
            self.pickerController.sourceType = type
            self.presentationController?.present(self.pickerController, animated: true)
        }
    }
    
    private func pickerController(_ controller: UIImagePickerController, didSelect url: URL?) {
        controller.dismiss(animated: true, completion: nil)
        
        self.delegate?.didSelect(url: url!)
    }
    
    public func present() {
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        if let action = self.action(for: .camera, title: "직접 촬영") {
            alertController.addAction(action)
        }
        
        if let action = self.action(for: .savedPhotosAlbum, title: "앨범") {
            alertController.addAction(action)
        }
        
        if let action = self.action(for: .photoLibrary, title: "라이브러리") {
            alertController.addAction(action)
        }
        alertController.addAction(UIAlertAction(title: "취소", style: .cancel, handler: nil))
        self.presentationController?.present(alertController, animated: true)
    }
    
    
}

extension VideoPicker: UIImagePickerControllerDelegate {
    public func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.pickerController(picker, didSelect: nil)
    }
    
    public func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let url = info[.mediaURL] as? URL else {
            return self.pickerController(picker, didSelect: nil)
        }
        return self.pickerController(picker, didSelect: url)
    }
    
}

extension VideoPicker: UINavigationControllerDelegate {}
