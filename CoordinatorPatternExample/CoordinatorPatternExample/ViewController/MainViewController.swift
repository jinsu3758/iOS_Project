//
//  ViewController.swift
//  CoordinatorPatternExample
//
//  Created by 박진수 on 2020/06/17.
//  Copyright © 2020 박진수. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, Storyboarded {
    weak var coordinator: MainCoordinator?
    var delegate: ViewControllerHandler?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func nextVC(_ sender: Any) {
//        coordinator?.showSecondVC()
        delegate?.click(event: .push)
    }
    

}

