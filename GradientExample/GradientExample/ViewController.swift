//
//  ViewController.swift
//  GradientExample
//
//  Created by 박진수 on 2020/10/16.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.frame
        gradientLayer.colors = [UIColor.red.cgColor, UIColor.blue.cgColor, UIColor.yellow.cgColor]
        gradientLayer.locations = [0, 0.3, 1]
        
        // 수직은 default
        // 수평
        
//        gradientLayer.startPoint = CGPoint(x:0, y:0.5)
//        gradientLayer.endPoint = CGPoint(x:1, y:0.5)
        
        // 원뿔형
        
//        gradientLayer.type = .conic
//        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.5)
//        gradientLayer.endPoint = CGPoint(x: 0.5, y: 0)
        
        
        // 대각선
        
//        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
//        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        
        self.view.layer.addSublayer(gradientLayer)
        
        
        // Do any additional setup after loading the view.
    }


}

