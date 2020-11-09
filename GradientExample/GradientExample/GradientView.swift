//
//  GradientView.swift
//  GradientExample
//
//  Created by 박진수 on 2020/10/19.
//

import UIKit

class GradientView: UIView {
    private var colors: [CGColor]
    private var style: GradientStyle
    private let gradientLayer = CAGradientLayer()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    init(frame: CGRect, style: GradientStyle, colors: [CGColor], locations: [NSNumber]? = nil) {
        self.colors = colors
        self.style = style
        gradientLayer.locations = locations
        super.init(frame: frame)
        updateGradientLayer()
    }
    
    private func updateGradientLayer() {
        gradientLayer.frame = self.frame
        gradientLayer.colors = colors
        
        switch style {
        case .horizontal:
            gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
            gradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
        case .vertical:
            gradientLayer.startPoint = CGPoint(x: 0.5, y: 0)
            gradientLayer.endPoint = CGPoint(x: 0.5, y: 1)
        case .conic:
            gradientLayer.type = .conic
            gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.5)
            gradientLayer.endPoint = CGPoint(x: 0.5, y: 0)
        case .leftDiagonal:
            gradientLayer.startPoint = CGPoint(x: 0, y: 0)
            gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        case .rightDiagonal:
            gradientLayer.startPoint = CGPoint(x: 1, y: 0)
            gradientLayer.endPoint = CGPoint(x: 0, y: 1)
        case .radial:
            gradientLayer.type = .radial
            gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.5)
            gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        }
        
        self.layer.addSublayer(gradientLayer)
    }
    
    func setAnimation(_ newColors: [CGColor], withDuration duration: TimeInterval = 1, repeatCount: Float = .infinity, timingFunctionName name: CAMediaTimingFunctionName? = nil ) {
        let animation = CABasicAnimation(keyPath: "colors")
        animation.fromValue = colors
        animation.toValue = newColors
        animation.duration = duration
        animation.timingFunction = CAMediaTimingFunction(name: name ?? .linear)
        animation.repeatCount = repeatCount
        animation.isRemovedOnCompletion = true
        animation.fillMode = CAMediaTimingFillMode.forwards
        animation.autoreverses = true
        animation.delegate = self
        
        gradientLayer.removeAllAnimations()
        gradientLayer.add(animation, forKey: "colorsChangeAnimation")
    }
    
    
}

// TODO: - Rx observable로 바꿔서 구독하게 하긴
extension GradientView: CAAnimationDelegate {
    func animationDidStart(_ anim: CAAnimation) {
        print("start!")
    }
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        print("stop!")
    }
    
    
}


extension UIColor {
    
    convenience init(red: Int, green: Int, blue: Int, a: CGFloat = 1.0) {
        self.init(
            red: CGFloat(red) / 255.0,
            green: CGFloat(green) / 255.0,
            blue: CGFloat(blue) / 255.0,
            alpha: a
        )
    }
    
    convenience init(hex: Int, a: CGFloat = 1.0) {
        self.init(
            red: (hex >> 16) & 0xFF,
            green: (hex >> 8) & 0xFF,
            blue: hex & 0xFF,
            a: a
        )
    }
}
