//
//  ValidationViewModel.swift
//  MVVMExample
//
//  Created by 박진수 on 25/01/2019.
//  Copyright © 2019 박진수. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

protocol ValidationViewModel {
    var errorMessage: String { get }
    
    var data: Variable<String> { get set }
    var errorValue: Variable<String?> { get }
    
    func validateCredentials() -> Bool
}
