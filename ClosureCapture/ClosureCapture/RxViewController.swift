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
    
    var disposeBag = DisposeBag()
    
    var value: Int = 0
    let observable = Observable<Int>.of(1,2,3)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 강한 참조일 경우 deinint 호출 x - 순환참조 일어남
        // pop이 바로 안 됨
        // unowned self 가능함
        
        observable
            .subscribe(onNext: { item in
                self.value = item
            }, onCompleted: {
                print("onComplete")
                self.value = 2
            })
//            .disposed(by: disposeBag)
        
//        button.rx.tap
//            .subscribe(onNext: { _ in
//                self.value = 1
////                self.doSomething()
////                self.navigationController?.popViewController(animated: true)
//            })
//            .disposed(by: disposeBag)
        
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
        
//        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0, execute: {
//            self.navigationController?.popViewController(animated: true)
//        })
            
    }
    
    deinit {
        print("RxViewController deinit")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
//        disposeBag = DisposeBag()
    }
    
    
    
    func doSomething() -> Int {
        print("do something")
        var a = 0
        for _ in 0...5000 {
            a += 1
        }
        print("\(a)")
        return a
    }
    
    @IBAction func tapButton(_ sender: Any) {
    }
    
    
}
