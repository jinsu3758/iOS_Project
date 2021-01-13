//
//  RxViewController.swift
//  ClosureCapture
//
//  Created by 박진수 on 2020/12/14.
//

import UIKit
import RxCocoa
import RxSwift

class RxViewController: UIViewController {
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var popButton: UIButton!
    
    var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // 강한 참조일 경우 deinint 호출 x - 순환참조 일어남
        // pop이 바로 안 됨
        // unowned self 가능함
        
        button.rx.tap
            .asDriver()
            .drive(onNext: { [unowned self] in
                print("wewwerwer")
//                self.navigationController?.popViewController(animated: true)
                let b = self.doSomething()
                let c = self.doSomething()

            })
        
        // 위와 동일
//        button.rx.tap
//            .asDriver()
//            .drive(onNext: { [unowned self] in
////                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
////                    self.navigationController?.popViewController(animated: true)
////
////                })
//                let b = self.doSomething()
//                let c = self.doSomething()
//
//            })
//            .disposed(by: disposeBag)
        
        
//        button.rx.tap
//            .asDriver()
//            .drive(onNext: {
//                let b = self.doSomething()
//                let c = self.doSomething()
//                self.navigationController?.popViewController(animated: true)
//            })
//            .disposed(by: disposeBag)
            
//        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0, execute: {
//            self.navigationController?.popViewController(animated: true)
//            
//        })
        popButton.rx.tap
            .asDriver()
            .drive(onNext: {
                self.navigationController?.popViewController(animated: true)
            })
            .disposed(by: disposeBag)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0, execute: {
            self.navigationController?.popViewController(animated: true)
        })
            
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
//        disposeBag = DisposeBag()
    }
    
    deinit {
        print("RxViewController deinit")
    }
    
    func doSomething() -> Int {
        print("do something")
        var a = 0
        for i in 0...5000 {
            a += i
        }
        return a
    }
    
    @IBAction func tapButton(_ sender: Any) {
    }
    

}
