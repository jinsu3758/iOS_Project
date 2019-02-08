//
//  ViewControllerType.swift
//  MVVMExample
//
//  Created by 박진수 on 31/01/2019.
//  Copyright © 2019 박진수. All rights reserved.
//

import Foundation
import UIKit

protocol ViewControllerType: class {
    associatedtype ViewModelType: ViewModelProtocol
    
    func setBinding(with viewModel: ViewModelType)
    
    static func create(with viewModel: ViewModelType) -> UIViewController
}
