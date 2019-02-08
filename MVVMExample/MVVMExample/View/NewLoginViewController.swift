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
    let loginManager = LoginManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = NewLoginViewModel(loginManager)
        setBinding(with: viewModel)
        
    }
    
    func setBinding(with viewModel: NewLoginViewModel) {
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
        
        viewModel.output.errorObservable
            .subscribe(onNext: { [unowned self] (error) in
                let alert = UIAlertController(title: nil, message: "다시 입력해주세요.", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            })
            .disposed(by: disposeBag)
        
        viewModel.output.loginResult
            .subscribe(onNext: { [unowned self] (user) in
                let alert = UIAlertController(title: nil, message: "로그인 성공!.", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            })
            .disposed(by: disposeBag)
    }
    
    static func create(with viewModel: NewLoginViewModel) -> UIViewController {
        let newLoginVC = AppStoryboard.main.instance.instantiateViewController(withIdentifier: VC.newLogin.rawValue)
                            as! NewLoginViewController
        newLoginVC.viewModel = viewModel
        return newLoginVC
    }


}
