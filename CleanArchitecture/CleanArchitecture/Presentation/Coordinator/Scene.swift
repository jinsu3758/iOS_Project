//
//  Scene.swift
//  CleanArchitecture
//
//  Created by 박진수 on 2020/08/11.
//  Copyright © 2020 jinsu. All rights reserved.
//

import Foundation
import UIKit

// 보류
protocol SceneType {
    var storyboardName: String { get }
}

enum TransitionStyle {
    case push
    case modal(UIModalTransitionStyle)
}

enum Scene: String {
    case signIn
    
    var storyboardName: String {
        switch self {
        case .signIn:
            return "Main"
        }
    }
}


extension Scene {
    var viewController: UIViewController {
        let storyboard = UIStoryboard(name: self.storyboardName, bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: self.rawValue)
        return viewController
    }
}
