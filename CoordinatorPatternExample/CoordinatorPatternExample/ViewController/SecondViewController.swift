//
//  SecondViewController.swift
//  CoordinatorPatternExample
//
//  Created by 박진수 on 2020/06/17.
//  Copyright © 2020 박진수. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, Storyboarded {
    weak var coordinator: MainCoordinator?
     var delegate: ViewControllerHandler?

    override func viewDidLoad() {
        super.viewDidLoad()

    }

}
