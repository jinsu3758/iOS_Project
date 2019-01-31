//
//  EmailViewModel.swift
//  MVVMExample
//
//  Created by 박진수 on 25/01/2019.
//  Copyright © 2019 박진수. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class EmailViewModel: ValidationViewModel {
    var errorMessage: String = "이메일이 유효하지 않습니다."
    
    var data: Variable<String> = Variable("")
    var errorValue: Variable<String?> = Variable("")
    
    func validateCredentials() -> Bool {
        guard validatePattern(text: data.value) else {
            errorValue.value = errorMessage
            return false
        }
        errorValue.value = ""
        return true
    }
    
    func validatePattern(text: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailTest.evaluate(with: text)
    }
    
    
}
