//
//  NewLoginViewController.swift
//  MVVMExample
//
//  Created by 박진수 on 31/01/2019.
//  Copyright © 2019 박진수. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class NewLoginViewController: UIViewController, ViewControllerType {
    
    typealias ViewModelType = NewLoginViewModel

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var pwdTextField: UITextField!
    @IBOutlet weak var LoginBtn: UIButton!
    
    var viewModel: ViewModelType!
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func configure(with viewModel: NewLoginViewModel) {
        emailTextField.rx.text.orEmpty
            .asObservable()
            .subscribe(viewModel.input.email)
            .disposed(by: disposeBag)
        
        pwdTextField.rx.text.orEmpty
            .asObservable()
            .subscribe(viewModel.input.pwd)
            .disposed(by: disposeBag)
        
        LoginBtn.rx.tap.asObservable()
            .subscribe(viewModel.input.loginDidTap)
            .disposed(by: disposeBag)
        
//        viewModel.output.errorObservable
//            .subscribe(onNext: { [unowned self] (error) in
//                
//            })
//            .disposed(by: disposeBag)
        
    }
    
    static func create(with viewModel: NewLoginViewModel) -> UIViewController {
        let newLoginVC = AppStoryboard.main.instance.instantiateViewController(withIdentifier: VC.newLoginVC.rawValue)
                            as! NewLoginViewController
        newLoginVC.viewModel = viewModel
        return newLoginVC
    }


}
