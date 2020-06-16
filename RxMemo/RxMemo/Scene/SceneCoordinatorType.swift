//
//  SceneCoordinatorType.swift
//  RxMemo
//
//  Created by 박진수 on 2020/06/12.
//  Copyright © 2020 박진수. All rights reserved.
//

import Foundation
import RxSwift

protocol SceneCoordinatorType {
    @discardableResult
    func transition(to scene: Scene, using style: TransitionStyle, animated: Bool) -> Completable
    
    @discardableResult
    func close(animated: Bool) -> Completable
    
}
