//
//  ViewController.swift
//  VideoStreaming
//
//  Created by 박진수 on 2020/11/09.
//

import UIKit

class ViewController: UIViewController {
    var videoPicker: VideoPicker?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        videoPicker = VideoPicker(presentationController: self, delegate: self)
        
        // Do any additional setup after loading the view.
    }

    @IBAction func action(_ sender: Any) {
        videoPicker?.present()
    }
    
}

extension ViewController: VideoPickerDelegate {
    func didSelect(url: URL?) {
        
    }
}

