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
protocol UseCaseType {
    
}

protocol SceneType {
    var storyboardName: String { get }
    var viewController: UIViewController { get }
    func getViewController(for useCase: UseCaseType) -> UIViewController
}

enum TransitionStyle {
    case push
    case modal(UIModalTransitionStyle)
}

//enum Scene: String {
//    case signIn
//
//    var storyboardName: String {
//        switch self {
//        case .signIn:
//            return "Main"
//        }
//    }
//}
//
//extension Scene {
//    func getViewController<T>() -> T {
//        let storyboard = UIStoryboard(name: self.storyboardName, bundle: nil)
//        let viewController = storyboard.instantiateViewController(withIdentifier: self.rawValue) as! T
//        return viewController
//    }
//
//    var viewController: UIViewController {
//        let storyboard = UIStoryboard(name: self.storyboardName, bundle: nil)
//        let viewController = storyboard.instantiateViewController(withIdentifier: self.rawValue)
//        return viewController
//    }
//}

enum Scene: String {
    case signIn
    
    var storyboardName: String {
        return "User"
    }
    
    func getViewController(diContainer: DIContainerType) -> UIViewController {
        let storyboard = UIStoryboard(name: self.storyboardName, bundle: nil)
        //            let viewController = storyboard.instantiateViewController(withIdentifier: self.rawValue)
        switch  self {
        case .signIn:
            let userDIContainer = diContainer as! UserDIContainer
            let useCase = userDIContainer.makeSignInUseCase()
            var viewController = storyboard.instantiateViewController(withIdentifier: self.rawValue) as! SignInViewController
            viewController.bindViewModel(SignInViewModel(useCase: useCase))
        }
        return viewController
    }
    
    var viewController: UIViewController {
        let storyboard = UIStoryboard(name: self.storyboardName, bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: self.rawValue)
        return viewController
    }
    
    
}



