//
//  ViewModelProtocol.swift
//  MVVMExample
//
//  Created by 박진수 on 31/01/2019.
//  Copyright © 2019 박진수. All rights reserved.
//

import Foundation

protocol ViewModelProtocol: class {
    associatedtype Input
    associatedtype Ouput
}
