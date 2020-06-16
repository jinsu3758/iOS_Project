//
//  TransitionModel.swift
//  RxMemo
//
//  Created by 박진수 on 2020/06/12.
//  Copyright © 2020 박진수. All rights reserved.
//

import Foundation

enum TransitionStyle {
    case root
    case push
    case modal
}

enum TransitionError: Error {
    case navigationControllerMissing
    case cannotPop
    case unknown
}
