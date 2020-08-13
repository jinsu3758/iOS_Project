//
//  AppCoordinator.swift
//  CleanArchitecture
//
//  Created by 박진수 on 2020/08/13.
//  Copyright © 2020 jinsu. All rights reserved.
//

import UIKit

final class AppCoordinator {
    var navigationController: UINavigationController
    private let appDIContainer: AppDIContainer
    
    init(navigationController: UINavigationController, appDIContainer: AppDIContainer) {
        self.navigationController = navigationController
        self.appDIContainer = appDIContainer
    }
    
    func start() {
//        let signInCoordinator = SignInCoordinator()
        
    }
}
