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
        DispatchQueue.main.async {
            let vc = MainViewController.instantiate(storyboardName: "Main")
            vc.coordinator = self
            vc.delegate = self
            self.navigationController.pushViewController(vc, animated: false)
        }
        
    }
    
    func showSecondVC() {
        let vc = SecondViewController.instantiate(storyboardName: "Main")
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    
}

extension MainCoordinator: ViewControllerHandler {
    func click(event: EventType) {
//        DispatchQueue.main.async {
            switch event {
            case .push:
                let nextVC = SecondViewController.instantiate(storyboardName: "Main")
                nextVC.coordinator = self
                nextVC.delegate = self
                self.navigationController.pushViewController(nextVC, animated: true)
            case .present:
                let nav = UINavigationController()
                nav.modalPresentationStyle = .fullScreen
                let childCoordinator = MainCoordinator(parent: self, navigationController: nav)
                self.childCoordinators.append(childCoordinator)
                self.navigationController.present(nav, animated: true)
            case .pop:
                self.navigationController.popViewController(animated: true)
            case .dismiss:
                self.parentCoordinator?.childCoordinators.removeLast()
                self.navigationController.dismiss(animated: true)
            }
//        }
    }
}
