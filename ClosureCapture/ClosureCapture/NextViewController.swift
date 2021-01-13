//
//  NextViewController.swift
//  ClosureCapture
//
//  Created by 박진수 on 2020/12/14.
//

import UIKit

class NextViewController: UIViewController {
    @IBOutlet weak var normalButton: UIButton!
    @IBOutlet weak var weakButton: UIButton!
    @IBOutlet weak var unownedButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    deinit {
        print("NextViewController deinit")
    }
    
//    lazy var animation: () -> Void = {
//        self.normalButton.frame = self.normalButton.frame.offsetBy(dx: -400, dy: 0)
//    }
//
    lazy var animation: () -> Void = { [weak self] in
        guard let self = self else { return }
        self.normalButton.frame = self.normalButton.frame.offsetBy(dx: -400, dy: 0)
    }
    
    
//    lazy var completionHandler: (Bool) -> Void = { _ in
//        self.completion()
//    }
    
    lazy var completionHandler: (Bool) -> Void = { [weak self] _ in
        guard let self = self else { return }
        self.completion()
    }
    
    // MARK: - 강한 참조
    @IBAction func tapNormal(_ sender: Any) {
        
//        UIView.animate(withDuration: 2.0, animations: animation,
//                       completion: { _ in
//                        self.completion()
//                       })
//        DispatchQueue.global().async { [weak self] in
//            guard let self = self else { return }
//            for _ in 0..<5000000 {
//                self.num += 1
//            }
//            print("\(self.num)")
//        }
//
//        DispatchQueue.main.async {
//            self.navigationController?.popViewController(animated: false)
//        }
        
        
//        UIView.animate(withDuration: 2.0, animations: {
//            self.normalButton.frame = self.normalButton.frame.offsetBy(dx: -400, dy: 0)
//        }, completion: { _ in
//            self.completion()
//        })
//
//        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0, execute: {
//            self.navigationController?.popViewController(animated: true)
//        })
    }
    
    var num = 0
    
    // MARK: - weak
    @IBAction func tapWeak(_ sender: Any) {
        
        
//        UIView.animate(withDuration: 2.0, animations: animation, completion:  completionHandler)
        
        UIView.animate(withDuration: 2.0, animations: { [weak self] in
            for _ in 0..<5000000 {
                            self?.num += 1
                        }
            self?.weakButton.frame = self?.weakButton.frame.offsetBy(dx: -400, dy: 0) ?? CGRect.zero
        }, completion: { [weak self] _ in
            self?.completion()
        })
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0, execute: {
            self.navigationController?.popViewController(animated: false)
        })
    }
    
    // MARK: - unowned
    @IBAction func tapUnowned(_ sender: Any) {
        UIView.animate(withDuration: 3.0, animations: { [unowned self] in
            self.unownedButton.frame = self.unownedButton.frame.offsetBy(dx: -400, dy: 0)
        }, completion: { [unowned self]  _ in
//            self.completion()
        })
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0, execute: { [unowned self] in
            self.navigationController?.popViewController(animated: true)
        })
    }
    
    
   
    
    //        animation()
    //        completion()
            
    //        UIView.animate(withDuration: 0.5, animations: {
    //            self.normalButton.alpha = 0
    //            self.normalButton.alpha = 1
    //        }, completion: { _ in
    //            self.navigationController?.popViewController(animated: true)
    //        })
    
    
    
    
    //        UIView.animate(withDuration: 3.0, animations: { [weak self] in
    //            guard let self = self else { return }
    //            self.weakButton.frame = self.weakButton.frame.offsetBy(dx: -400, dy: 0)
    //            self.completion()
    //            self.completion()
    //        }, completion: { [weak self]  _ in
    //            guard let self = self else { return }
    //            self.completion()
    //        })
    
    
    
   
    
    
    
    func completion() {
        print("completion")
    }
    
    
    //        var a = 0
    //        for i in 0..<5000000 {
    //            a += i
    //        }
    
    
    
  
    
    
}
