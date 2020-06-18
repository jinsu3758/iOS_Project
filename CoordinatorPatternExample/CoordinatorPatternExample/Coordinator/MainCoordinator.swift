//
//  MainCoordinator.swift
//  CoordinatorPatternExample
//
//  Created by 박진수 on 2020/06/17.
//  Copyright © 2020 박진수. All rights reserved.
//

import UIKit

class MainCoordinator: Coordinator {
    var parentCoordinator: Coordinator?
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(parent: Coordinator?, navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.parentCoordinator = parent
    }
    
    func start() {
        let vc = MainViewController.instantiate(storyboardName: "Main")
        vc.coordinator = self
        vc.delegate = self
        navigationController.pushViewController(vc, animated: false)
    }
    
    func showSecondVC() {
        let vc = SecondViewController.instantiate(storyboardName: "Main")
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    
}

extension MainCoordinator: ViewControllerHandler {
    func click(event: EventType) {
        switch event {
        case .push:
            let nextVC = 
        }
    }
}
