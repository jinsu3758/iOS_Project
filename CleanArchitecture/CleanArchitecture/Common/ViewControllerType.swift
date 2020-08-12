//
//  ViewControllerType.swift
//  CleanArchitecture
//
//  Created by 박진수 on 2020/08/12.
//  Copyright © 2020 jinsu. All rights reserved.
//

import UIKit

protocol ViewControllerType {
//    associatedtype T
//    var viewModel: T! { get set }
    var viewModel: ViewModelType! { get set }
    func bindView()
}

extension ViewControllerType where Self: UIViewController {
    mutating func bindViewModel(_ model: ViewModelType) {
        viewModel = model
        loadViewIfNeeded() // 찾아보기
        bindView()
    }
//    mutating func bindViewModel(_ model: T) {
//        viewModel = model
//        loadViewIfNeeded() // 찾아보기
//        bindView()
//    }
}
