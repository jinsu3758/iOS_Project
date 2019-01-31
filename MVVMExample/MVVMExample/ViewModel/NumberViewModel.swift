//
//  NumberViewModel.swift
//  MVVMExample
//
//  Created by 박진수 on 28/01/2019.
//  Copyright © 2019 박진수. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class NumberViewModel {
    let model: Number
    let disposeBag = DisposeBag()
    
    let num: Observable<Int>
    
    let didTapRelay = PublishRelay<Void>()
    
    init() {
        model = Number()
        self.num = model.number.asObservable()
        
        didTapRelay.subscribe(onNext: { [weak self] _ in
            guard let `self` = self else { return }
            self.model.number.accept(self.model.number.value + 1)
        }).disposed(by: disposeBag)
    }
}
