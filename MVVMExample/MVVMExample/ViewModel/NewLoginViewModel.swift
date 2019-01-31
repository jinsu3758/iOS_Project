//
//  NewLoginViewModel.swift
//  MVVMExample
//
//  Created by 박진수 on 31/01/2019.
//  Copyright © 2019 박진수. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

class NewLoginViewModel: ViewModelProtocol {
    
    struct Input {
        let email: AnyObserver<String>
        let pwd: AnyObserver<String>
        let loginDidTap: AnyObserver<Void>
    }
    
    struct Output {
        let loginResult: Observable<User>
        let errorObservable: Observable<Error>
    }
    
    let input: Input
    let output: Output
    
    private let emailSubject = PublishSubject<String>()
    private let pwdSubject = PublishSubject<String>()
    private let loginDidTapSubject = PublishSubject<Void>()
    private let loginResultSubject = PublishSubject<User>()
    private let errorSubject = PublishSubject<Error>()
    
    init() {
        input = Input(email: emailSubject.asObserver(), pwd: pwdSubject.asObserver()
            , loginDidTap: loginDidTapSubject.asObserver())
        output = Output(loginResult: loginResultSubject.asObserver(), errorObservable: errorSubject.asObserver())
    }
    
    
}
