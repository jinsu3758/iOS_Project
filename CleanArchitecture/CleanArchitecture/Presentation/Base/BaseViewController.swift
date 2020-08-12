//
//  BaseViewController.swift
//  CleanArchitecture
//
//  Created by 박진수 on 2020/08/12.
//  Copyright © 2020 jinsu. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    var viewModel: ViewModelType!
    
    func bindViewModel(_ viewModel: ViewModelType) {
        self.viewModel = viewModel
    }
}
