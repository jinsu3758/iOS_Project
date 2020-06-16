//
//  SceneCoordinator.swift
//  RxMemo
//
//  Created by 박진수 on 2020/06/12.
//  Copyright © 2020 박진수. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class SceneCoordinator: SceneCoordinatorType {
    private let bag = DisposeBag()
    
    private var window: UIWindow
    private var currentVC: UIViewController
    
    // 왜 required??
    required init(window: UIWindow) {
        self.window = window
        currentVC = window.rootViewController!
    }
    
    @discardableResult
    func transition(to scene: Scene, using style: TransitionStyle, animated: Bool) -> Completable {
        // Completable로 선언 안 하고 subject로 하는 이유
        // 코드가 복잡해지고 클로저 내에 creat를 해야하므로
        let subject = PublishSubject<Void>()
        
        let target = scene.instantiate()
        
        switch style {
        case .root:
            currentVC = target.sceneViewController
            window.rootViewController = target
            subject.onCompleted()
        case .push:
            guard let nav = currentVC.navigationController else { subject.onError(TransitionError.navigationControllerMissing); break }
            nav.rx.willShow
                .subscribe(onNext: { [unowned self] evt in
                    self.currentVC = evt.viewController.sceneViewController
                })
                .disposed(by: bag)
            nav.pushViewController(target, animated: animated)
            subject.onCompleted()
        case .modal:
            currentVC.present(target, animated: animated) {
                subject.onCompleted()
            }
            currentVC = target.sceneViewController
        }
        
        
        return subject.ignoreElements() // Completable로 변환되어 리턴됨
    }
    
    @discardableResult
    func close(animated: Bool) -> Completable {
        return Completable.create { [unowned self] completable in
            if let presentingVC = self.currentVC.presentingViewController {
                self.currentVC.dismiss(animated: animated, completion: {
                    self.currentVC = presentingVC.sceneViewController
                    completable(.completed)
                })
            }
            else if let nav = self.currentVC.navigationController {
                guard nav.popViewController(animated: animated) != nil else {
                    completable(.error(TransitionError.cannotPop))
                    return Disposables.create()
                }
                self.currentVC = nav.viewControllers.last!
                completable(.completed)
            }
            else {
                completable(.error(TransitionError.unknown))
            }
            return Disposables.create()
        }
    }
    
    
}

