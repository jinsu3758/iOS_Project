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
    case mainVC = "mainVC"
    case loginVC = "loginVC"
    case numVC = "numberVC"
    case colorVC = "colorVC"
}
