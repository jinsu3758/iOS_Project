//
//  NewLoginViewController.swift
//  MVVMExample
//
//  Created by 박진수 on 31/01/2019.
//  Copyright © 2019 박진수. All rights reserved.
//

import UIKit

class NewLoginViewController: UIViewController, ViewControllerType {
    typealias ViewModelType = NewLoginViewModel
    

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var pwdTextField: UITextField!
    @IBOutlet weak var LoginBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }


}
