//
//  Enums.swift
//  MVVMExample
//
//  Created by 박진수 on 28/01/2019.
//  Copyright © 2019 박진수. All rights reserved.
//

import Foundation
import UIKit

enum AppStoryboard: String {
    case main = "Main"
    
    var instance: UIStoryboard {
        return UIStoryboard(name: self.rawValue, bundle: Bundle.main)
    }
    
}

enum VC: String {
    case main = "mainVC"
    case login = "loginVC"
    case num = "numberVC"
    case color = "colorVC"
    case newLogin = "newLoginVC"
}

enum CustomError: Error {
    case invalidForm
}
