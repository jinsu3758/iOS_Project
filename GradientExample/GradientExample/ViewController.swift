//
//  ViewController.swift
//  GradientExample
//
//  Created by 박진수 on 2020/10/16.
//

import UIKit

enum GradientStyle {
    /// 사선
    case leftDiagonal
    case rightDiagonal
    case horizontal
    case vertical
    /// 원뿔형의
    case conic
    /// 방사형의
    case radial
    
}

class ViewController: UIViewController {
    @IBOutlet weak var gradientView: UIView!
    var gradient: GradientView!
    var colors: [CGColor] = [UIColor.red.cgColor, UIColor.blue.cgColor, UIColor.yellow.cgColor]
    let gradientLayer = CAGradientLayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        gradient = GradientView(frame: gradientView.bounds, style: .leftDiagonal, colors: colors)
        gradientView.addSubview(gradient)
        
        
//        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.frame
        gradientLayer.colors = [UIColor.red.cgColor, UIColor.blue.cgColor, UIColor.yellow.cgColor]
        gradientLayer.locations = [0, 0.3, 1]
//        gradientView.layer.addSublayer(gradientLayer)
        
        // 수직은 default
        // 수평
        
//        gradientLayer.startPoint = CGPoint(x:0, y:0.5)
//        gradientLayer.endPoint = CGPoint(x:1, y:0.5)
        
        // 원뿔형
        
//        gradientLayer.type = .conic
//        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.5)
//        gradientLayer.endPoint = CGPoint(x: 0.5, y: 0)
        
        
        // 왼쪽 대각선
        
//        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
//        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        
        
//         오른쪽 대각선
        
        gradientLayer.startPoint = CGPoint(x: 1, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0, y: 1)
        
//        self.view.layer.addSublayer(gradientLayer)
        
        // 방사형
//        gradientLayer.type = .radial
//        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.5)
//        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        
//        setAnimation([UIColor.green.cgColor, UIColor.gray.cgColor, UIColor.brown.cgColor])
        
        // Do any additional setup after loading the view.
    }
    
    func setAnimation(_ newColors: [CGColor], withDuration duration: TimeInterval = 1, repeatCount: Float = .infinity, timingFunctionName name: CAMediaTimingFunctionName? = nil ) {
        let colorAnimation = CABasicAnimation(keyPath: "colors")
        colorAnimation.fromValue = colors
        colorAnimation.toValue = newColors
        colorAnimation.duration = duration
//        colorAnimation.isRemovedOnCompletion = false
        colorAnimation.fillMode = CAMediaTimingFillMode.forwards
        colorAnimation.timingFunction = CAMediaTimingFunction(name: name ?? .linear)
        colorAnimation.repeatCount = repeatCount
        colorAnimation.autoreverses = true
        
        gradientLayer.removeAllAnimations()
        gradientLayer.add(colorAnimation, forKey: "colorsChangeAnimation")
        
    }

    @IBAction func startAnimation(_ sender: Any) {
        gradient.setAnimation([UIColor.green.cgColor, UIColor.gray.cgColor, UIColor.brown.cgColor], withDuration: 1.5)
    }
    
    @IBAction func stopAnimation(_ sender: Any) {
        gradientLayer.colors = [UIColor.black.cgColor, UIColor.orange.cgColor, UIColor.white.cgColor]
        setAnimation([UIColor.green.cgColor, UIColor.gray.cgColor, UIColor.brown.cgColor])
    }
    
    @IBAction func linear(_ sender: Any) {
        gradient.setAnimation([UIColor.green.cgColor, UIColor.gray.cgColor, UIColor.brown.cgColor], withDuration: 2, timingFunctionName: .linear)
    }
    
    @IBAction func easeIn(_ sender: Any) {
        gradient.setAnimation([UIColor.green.cgColor, UIColor.gray.cgColor, UIColor.brown.cgColor], withDuration: 2, timingFunctionName: .easeIn)
    }
    
    @IBAction func easeOut(_ sender: Any) {
        gradient.setAnimation([UIColor.green.cgColor, UIColor.gray.cgColor, UIColor.brown.cgColor], withDuration: 2, timingFunctionName: .easeOut)
    }
    
    @IBAction func easeInOut(_ sender: Any) {
        gradient.setAnimation([UIColor.green.cgColor, UIColor.gray.cgColor, UIColor.brown.cgColor], withDuration: 2, timingFunctionName: .easeInEaseOut)
    }
}

