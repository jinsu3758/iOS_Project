//
//  Number.swift
//  MVVMExample
//
//  Created by 박진수 on 28/01/2019.
//  Copyright © 2019 박진수. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

struct Number {
    let number = BehaviorRelay<Int>(value: 0)
}
