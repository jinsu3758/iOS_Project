//
//  LoginViewModel.swift
//  MVVMExample
//
//  Created by 박진수 on 25/01/2019.
//  Copyright © 2019 박진수. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

enum Invalid {
    case email
    case pwd
    case not
}

class LoginViewModel {
    
    var user: User?
    let disposebag = DisposeBag()
    
    let emailViewModel = EmailViewModel()
    let passwordViewModel = PasswordViewModel()
    
    let isSuccess: Variable<Bool> = Variable(false)
    let isLoading: Variable<Bool> = Variable(false)
    let errorMsg: Variable<String> = Variable("")
    
    func validateCredentials() -> Invalid {
        if !emailViewModel.validateCredentials() {
            return .email
        }
        else if !passwordViewModel.validateCredentials() {
            return .pwd
        }
        else {
            return .not
        }
    }
    
    func onLogin(callback: @escaping (Bool) -> ()) {
        user?.email = emailViewModel.data.value
        user?.pwd = passwordViewModel.data.value
        
        callback(true)
    }
    
}
