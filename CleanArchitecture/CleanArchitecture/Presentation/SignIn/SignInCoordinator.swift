//
//  SignInCoordinator.swift
//  CleanArchitecture
//
//  Created by 박진수 on 2020/08/13.
//  Copyright © 2020 jinsu. All rights reserved.
//

import UIKit

class SignInCoordinator {
    private let navigationController: UINavigationController
    private let userDIContainer = UserDIContainer()
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        var signInViewController = SignInViewController()
        let signInViewModel = userDIContainer.makeSignInViewModel()
        signInViewController.bindViewModel(<#T##model: ViewModelType##ViewModelType#>)
        
    }
}
