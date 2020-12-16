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
    
    
    lazy var animation: () -> Void = {
        self.normalButton.frame = self.normalButton.frame.offsetBy(dx: -400, dy: 0)
    }
    
    lazy var completionHandler: (Bool) -> Void = { _ in
        self.completion()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    deinit {
        print("NextViewController deinit")
    }

    @IBAction func tapNormal(_ sender: Any) {
        
//        animation()
//        completion()
        
        UIView.animate(withDuration: 3.0, animations: {
            self.normalButton.frame = self.normalButton.frame.offsetBy(dx: -400, dy: 0)
        }, completion: { _ in
            self.completion()
        })
//
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0, execute: {
            self.navigationController?.popViewController(animated: true)
        })
        
    }
    
    @IBAction func tapWeak(_ sender: Any) {
        UIView.animate(withDuration: 3.0, animations: { [weak self] in
            self?.weakButton.frame = self?.weakButton.frame.offsetBy(dx: -400, dy: 0) ?? CGRect.zero
        }, completion: { [weak self]  _ in
            self?.completion()
        })
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0, execute: { [weak self] in
            self?.navigationController?.popViewController(animated: true)
        })
    }
    
    
    @IBAction func tapUnowned(_ sender: Any) {
        UIView.animate(withDuration: 3.0, animations: { [unowned self] in
            self.unownedButton.frame = self.unownedButton.frame.offsetBy(dx: -400, dy: 0)
        }, completion: { [unowned self]  _ in
            self.completion()   // 여기서 문제
        })
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0, execute: { [unowned self] in
            self.navigationController?.popViewController(animated: true)
        })
    }
    
    func completion() {
        print("completion")
    }
}
