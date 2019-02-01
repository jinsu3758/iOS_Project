//
//  LoginManager.swift
//  MVVMExample
//
//  Created by 박진수 on 31/01/2019.
//  Copyright © 2019 박진수. All rights reserved.
//

import Foundation
import RxSwift

protocol LoginServiceProtocol {
    func onLogin(with credentials: Credential) -> Observable<NewUser>
}

class LoginManager: LoginServiceProtocol {
    func onLogin(with credentials: Credential) -> Observable<NewUser> {
        return Observable.create{ observer in
            if credentials.email != "" && credentials.pwd != "" {
                observer.onNext(NewUser(email: credentials.email, pwd: credentials.pwd))
            }
            else {
                observer.onError(CustomError.invalidForm)
            }
            
            
            return Disposables.create()
        }
    }
    
    
}
