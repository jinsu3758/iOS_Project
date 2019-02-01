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
        let loginResult: Observable<NewUser>
        let errorObservable: Observable<Error>
    }
    
    let input: Input
    let output: Output
    
    private let emailSubject = PublishSubject<String>()
    private let pwdSubject = PublishSubject<String>()
    private let loginDidTapSubject = PublishSubject<Void>()
    private let loginResultSubject = PublishSubject<NewUser>()
    private let errorSubject = PublishSubject<Error>()
    private let disposeBag = DisposeBag()
    
    private var credentialObservable: Observable<Credential> {
        // combineLatest
        // 두 Observable의 마지막 이벤트들을 묶어서 전달
        return Observable.combineLatest(emailSubject.asObservable(), pwdSubject.asObservable()) { (email, pwd) in
            return Credential(email: email, pwd: pwd)
        }
    }
    
    init(_ loginManager: LoginServiceProtocol) {
        input = Input(email: emailSubject.asObserver(), pwd: pwdSubject.asObserver()
            , loginDidTap: loginDidTapSubject.asObserver())
        output = Output(loginResult: loginResultSubject.asObserver(), errorObservable: errorSubject.asObserver())
        
        loginDidTapSubject.withLatestFrom(credentialObservable)
            .flatMapLatest{ credentials in
                // materialize
                // observable in observable로 감싸줄 수 있음
                return loginManager.onLogin(with: credentials).materialize()
            }.subscribe(onNext: { [weak self] event in
                switch event {
                case.next(let user):
                    self?.loginResultSubject.onNext(user)
                case .error(let error):
                    self?.errorSubject.onNext(error)
                default:
                    break
                }
            })
            .disposed(by: disposeBag)
    }
    
    
}
