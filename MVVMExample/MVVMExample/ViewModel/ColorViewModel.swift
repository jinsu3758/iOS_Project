//
//  ColorViewModel.swift
//  MVVMExample
//
//  Created by 박진수 on 30/01/2019.
//  Copyright © 2019 박진수. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class ColorViewModel {
    var count = BehaviorRelay<Int>(value: 0)
    
    let changeCount = PublishRelay<Void>()
    let disposeBag = DisposeBag()
    
    func addCount() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            let cnt = self.count.value
            
            if cnt < 3 {
                self.count.accept(self.count.value + 1)
                self.addCount()
            }
            else {
                self.count.accept(0)
            }
        }
    }
    
    init() {
        changeCount.subscribe(onNext: { _ in
            self.addCount()
        }).disposed(by: disposeBag)
    }
    
}
