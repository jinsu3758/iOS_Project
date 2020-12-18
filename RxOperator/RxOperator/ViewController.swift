//
//  ViewController.swift
//  RxOperator
//
//  Created by 박진수 on 2020/12/17.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {

    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        combine()
        withLatestFrom()
    }


}

// MARK: - 합성
extension ViewController {
    func combine() {
        let num = Observable.of(1, 2, 3, 4)
        let alphabet = Observable.of("a", "b", "c", "d", "e")
        Observable.combineLatest(num, alphabet)
            .subscribe { (num, alphabet) in
                print("\(num) \(alphabet)")
            }
            .disposed(by: disposeBag)
        // Print
        // 1 a
        // 2 a
        // 2 b
        // 3 b
        // 3 c
        // 4 c
        // 4 d
        // 4 e
    }
    
    func withLatestFrom() {
        let num = Observable<Int>.interval(1, scheduler: MainScheduler.asyncInstance).take(6)
        let alphabet = Observable.from(["a", "b", "c", "d", "e"])
        num.withLatestFrom(alphabet) { (num, alphabet) in
            "\(num) \(alphabet)"
        }
            .subscribe { result in
                print(result)
            }
            .disposed(by: disposeBag)
        
        let a = Observable.from([A(), A()])
        let b = Observable.from([B(), B()])
        a.withLatestFrom(b, resultSelector: { (a, b) in
            
        })
        
        a.withLatestFrom(b)
            .subscribe { result in
                print(result)
            }
            .disposed(by: disposeBag)
        

    }
}

class A {
}

class B {
    
}
