//
//  PasswordViewModel.swift
//  MVVMExample
//
//  Created by 박진수 on 25/01/2019.
//  Copyright © 2019 박진수. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class PasswordViewModel: ValidationViewModel {
    var errorMessage: String = "비밀번호가 유효하지 않습니다."
    
    var data: Variable<String> = Variable("")
    var errorValue: Variable<String?> = Variable("")
    
    func validateCredentials() -> Bool {
        guard validateLength(text: data.value, size: (5,15)) else {
            errorValue.value = errorMessage
            return false
        }
        errorValue.value = ""
        return true
    }
    
    func validateLength(text: String, size: (min: Int, max: Int)) -> Bool {
        return (size.min...size.max).contains(text.count)
    }
    
    
}
