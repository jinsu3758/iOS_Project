//
//  ImageHueViewController.swift
//  GradientExample
//
//  Created by 박진수 on 2020/10/21.
//

import UIKit
import RxSwift
import CoreGraphics

class ImageHueViewController: UIViewController {
    @IBOutlet weak var oneView: UIView!
    @IBOutlet weak var twoView: UIView!
    @IBOutlet weak var threeView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    
    var image1 = UIImage(named: "bg_gradient")!
    let image2 = UIImage(named: "bg_gradient2")!
    var toggle: Int = 1
    
    var result: UIImage?
    var result2: UIImage?
    var result3: UIImage?
    var result4: UIImage?
    var result5: UIImage?

    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let aColor = UIColor(hex: 0xF5B2B3).cgColor
        let bColor = UIColor(hex: 0xCEEFF4).cgColor
        let cColor = UIColor(hex: 0xB9C8E7).cgColor
        let dColor = UIColor(hex: 0xF3F4D0).cgColor
        
        let oneGradient = CAGradientLayer()
        let twoGradient = CAGradientLayer()
        let threeGradient = CAGradientLayer()
        
        oneGradient.frame = oneView.bounds
        twoGradient.frame = twoView.bounds
        threeGradient.frame = threeView.bounds
        
        oneGradient.colors = [aColor, bColor]
        twoGradient.colors = [bColor, cColor]
        threeGradient.colors = [cColor, aColor]
        
        oneGradient.startPoint = CGPoint(x: 0, y: 0)
        oneGradient.endPoint = CGPoint(x: 1, y: 1)
        
        oneView.layer.addSublayer(oneGradient)
        twoView.layer.addSublayer(twoGradient)
        threeView.layer.addSublayer(threeGradient)
        
        var sourceCode: CIImage? = nil
        if let cg = image1.cgImage {
            sourceCode = CIImage(cgImage: cg)
        }
        
        let hueAdjust = CIFilter(name: "CIHueAdjust")
        hueAdjust?.setDefaults()
        hueAdjust?.setValue(sourceCode, forKey: "inputImage")
        hueAdjust?.setValue(NSNumber(value: Float(0.5)), forKey: "inputAngle")
        let resultCode = hueAdjust?.value(forKey: "outputImage") as? CIImage
        
        hueAdjust?.setValue(NSNumber(value: Float(1.5)), forKey: "inputAngle")
        let resultCode2 = hueAdjust?.value(forKey: "outputImage") as? CIImage
        
        hueAdjust?.setValue(NSNumber(value: Float(3)), forKey: "inputAngle")
        let resultCode3 = hueAdjust?.value(forKey: "outputImage") as? CIImage
        
        hueAdjust?.setValue(NSNumber(value: Float(4.5)), forKey: "inputAngle")
        let resultCode4 = hueAdjust?.value(forKey: "outputImage") as? CIImage
        
        hueAdjust?.setValue(NSNumber(value: Float(6)), forKey: "inputAngle")
        let resultCode5 = hueAdjust?.value(forKey: "outputImage") as? CIImage
        
        let context = CIContext(options: nil)
        var resultRef: CGImage? = nil
        var resultRef2: CGImage? = nil
        var resultRef3: CGImage? = nil
        var resultRef4: CGImage? = nil
        var resultRef5: CGImage? = nil
        
        if let resultCode = resultCode {
            resultRef = context.createCGImage(resultCode, from: resultCode.extent)
        }
        
        if let resultCode2 = resultCode2 {
            resultRef2 = context.createCGImage(resultCode2, from: resultCode2.extent)
        }
        
        if let resultCode3 = resultCode3 {
            resultRef3 = context.createCGImage(resultCode3, from: resultCode3.extent)
        }
        
        if let resultCode4 = resultCode4 {
            resultRef4 = context.createCGImage(resultCode4, from: resultCode4.extent)
        }
        
        if let resultCode5 = resultCode5 {
            resultRef5 = context.createCGImage(resultCode5, from: resultCode5.extent)
        }
        
        
        if let resultRef = resultRef {
            result = UIImage(cgImage: resultRef)
        }
        
        if let resultRef2 = resultRef2 {
            result2 = UIImage(cgImage: resultRef2)
        }
        
        if let resultRef3 = resultRef3 {
            result3 = UIImage(cgImage: resultRef3)
        }
        
        if let resultRef4 = resultRef4 {
            result4 = UIImage(cgImage: resultRef4)
        }
        
        if let resultRef5 = resultRef5 {
            result5 = UIImage(cgImage: resultRef5)
        }
        
        
        
        //        let animation = CABasicAnimation(keyPath: "contents")
        //        animation.fromValue = image1
        //        animation.toValue = image2
        ////        animation.repeatCount = .infinity
        ////        animation.autoreverses = true
        //        animation.duration = 1.0
        //
        //        imageView.layer.add(animation, forKey: "contents")
        
        
    }
    
    @IBAction func start(_ sender: Any) {
        
//        UIView.animateKeyframes(withDuration: 3.0, delay: 0, options: [.repeat], animations: { [unowned self] in
//            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.5, animations: {
//                self.imageView.image = image1
//            })
//            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.5, animations: {
//                self.imageView.image = result
//            })
//            UIView.addKeyframe(withRelativeStartTime: 1.0, relativeDuration: 0.5, animations: {
//                self.imageView.image = result2
//            })
//            UIView.addKeyframe(withRelativeStartTime: 1.5, relativeDuration: 0.5, animations: {
//                self.imageView.image = result3
//            })
//            UIView.addKeyframe(withRelativeStartTime: 2.0, relativeDuration: 0.5, animations: {
//                self.imageView.image = result4
//            })
//            UIView.addKeyframe(withRelativeStartTime: 2.5, relativeDuration: 0.5, animations: {
//                self.imageView.image = result5
//            })
        
//        })
        
        
        
        let observable = Observable<Int>.interval(.milliseconds(800), scheduler: MainScheduler.instance)
            .subscribe { [unowned self] time in
                print("\(time)!!")
                UIView.transition(with: self.imageView, duration: 0.8, options: [.transitionCrossDissolve], animations: { [unowned self] in
                    if toggle == 7 {
                        toggle = 1
                    }
                    switch toggle {
                    case 1:
                        self.imageView.image = image1
                    case 2:
                        self.imageView.image = result
                    case 3:
                        self.imageView.image = result2
                    case 4:
                        self.imageView.image = result3
                    case 5:
                        self.imageView.image = result4
                    case 6:
                        self.imageView.image = result5
                    default: break
                    }
                    toggle += 1
                }, completion: nil)
            }
            .disposed(by: disposeBag)
        
        
        
//        UIView.animate(withDuration: 2.0, animations: {
//            if self.toggle {
//                self.imageView.image = self.result3
//            }
//            else {
//                self.imageView.image = self.image1
//            }
//            self.toggle = !self.toggle
//
//        })
        
        
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
