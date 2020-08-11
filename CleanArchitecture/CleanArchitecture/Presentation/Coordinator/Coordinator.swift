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
    var currentViewController: UIViewController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.currentViewController = navigationController
    }
    
    func start(from scene: Scene) {
        transition(to: scene, style: .push, animated: false)
    }
    
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
