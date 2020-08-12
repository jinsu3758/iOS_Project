//
//  SignInViewModel.swift
//  CleanArchitecture
//
//  Created by 박진수 on 2020/08/11.
//  Copyright © 2020 jinsu. All rights reserved.
//

import Foundation

class SignInViewModel: ViewModelType {
    let useCase: SignInUseCaseType
    
    init(useCase: UseCaseType) {
        self.useCase = useCase as! SignInUseCaseType
    }
}
