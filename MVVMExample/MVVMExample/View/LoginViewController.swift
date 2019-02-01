//
//  LoginViewController.swift
//  MVVMExample
//
//  Created by 박진수 on 25/01/2019.
//  Copyright © 2019 박진수. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var pwdTextField: UITextField!
    @IBOutlet weak var loginBtn: UIButton!
    
    let viewModel = LoginViewModel()
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBinding()
    }
    
    func setBinding() {
        emailTextField.rx.text.orEmpty
            .bind(to: viewModel.emailViewModel.data)
            .disposed(by: disposeBag)
        
        pwdTextField.rx.text.orEmpty
            .bind(to: viewModel.passwordViewModel.data)
            .disposed(by: disposeBag)
        
        loginBtn.rx.tap.do( onNext: { [unowned self] in
            self.emailTextField.resignFirstResponder()
            self.pwdTextField.resignFirstResponder()
        }).subscribe(onNext: { [unowned self] in
            switch self.viewModel.validateCredentials() {
            case .email:
                let alert = UIAlertController(title: nil, message: "이메일을 다시 입력해주세요.", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            case .pwd:
                let alert = UIAlertController(title: nil, message: "비밀번호을 다시 입력해주세요.", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            case .not:
                self.viewModel.onLogin(callback: { code in
                    if code {
                        let mainVC = AppStoryboard.main.instance.instantiateViewController(withIdentifier: VC.main.rawValue)
                            as! MainViewController
                        self.navigationController?.pushViewController(mainVC, animated: true)
                    }
                })
            }
        }).disposed(by: disposeBag)
        
        
        
    }
}
