//
//  ViewControllerHandler.swift
//  CoordinatorPatternExample
//
//  Created by 박진수 on 2020/06/17.
//  Copyright © 2020 박진수. All rights reserved.
//

import UIKit

protocol ViewControllerHandler: AnyObject {
    func click(event: EventType)
}

enum EventType {
    case push
    case pop
    case present
    case dismiss
}
