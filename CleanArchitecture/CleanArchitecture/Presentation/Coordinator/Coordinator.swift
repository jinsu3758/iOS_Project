//
//  Coordinator.swift
//  CleanArchitecture
//
//  Created by 박진수 on 2020/08/11.
//  Copyright © 2020 jinsu. All rights reserved.
//

import UIKit
import RxSwift

protocol CoordinatorType {
    func start(from scene: Scene)
    func transition(to scene: Scene, style: TransitionStyle, animated: Bool) -> Completable
    func dismiss(animated: Bool) -> Completable
    func pop(to scene: Scene?, animated: Bool)
    func alert(title: String, message: String) -> Completable
}

class Coordinator: CoordinatorType {
    
    let navigationController: UINavigationController
    let appDIContainer: AppDIContainer
    var currentViewController: UIViewController
    
    init(navigationController: UINavigationController, appDIContainer: AppDIContainer) {
        self.navigationController = navigationController
        self.appDIContainer = appDIContainer
        self.currentViewController = navigationController
    }
    
    func start(from scene: Scene) {
        transition(to: scene, style: .push, animated: false)
    }
    
//    func trans(to scene: UserScene) {
//        let userDIContainer = appDIContainer.makeUserDIContainer()
//
//        switch scene {
//        case .signIn:
//            let useCase = userDIContainer.makeSignInUseCase()
//            let vc = scene.getViewController(for: useCase)
//
//        }

////
////        var vc: SignInViewController = scene.getViewController()
////        vc.bindViewModel(viewModel as! SignInViewModel)
//    }

    @discardableResult
    func transition(to scene: Scene, style: TransitionStyle, animated: Bool) -> Completable {
        let viewController = scene.viewController
        let subject = PublishSubject<Void>()
        
        switch style {
        case .push:
            self.navigationController.pushViewController(viewController, animated: animated)
            self.currentViewController = viewController
            subject.onCompleted()
        case .modal(let modalStyle):
            viewController.modalTransitionStyle = modalStyle
            self.currentViewController.present(viewController, animated: animated, completion: {
                subject.onCompleted()
            })
        }
        
        return subject.ignoreElements()
    }
    
    @discardableResult
    func dismiss(animated: Bool) -> Completable {
        let subject = PublishSubject<Void>()
        
        self.currentViewController.dismiss(animated: animated, completion: {
            subject.onCompleted()
        })
        
        return subject.ignoreElements()
    }
    
    func pop(to scene: Scene?, animated: Bool) {
        if let scene = scene {
            let viewController = scene.viewController
            self.navigationController.popToViewController(viewController, animated: animated)
        }
        else {
            self.navigationController.popViewController(animated: animated)
        }
    }
    
    func alert(title: String, message: String) -> Completable {
        let subject = PublishSubject<Void>()
        return subject.ignoreElements()
    }
    
}
