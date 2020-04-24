//
//  ColorViewController.swift
//  MVVMExample
//
//  Created by 박진수 on 30/01/2019.
//  Copyright © 2019 박진수. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ColorViewController: UIViewController {

    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var sketchView: UIView!
    @IBOutlet weak var changeBtn: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    
    let viewModel = ColorViewModel()
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBinding()
    }
    
    func setBinding() {
        
        viewModel.count.do(onNext: { cnt in
                switch(cnt) {
                case 0:
                    self.sketchView.backgroundColor = UIColor.red
                case 1:
                    self.sketchView.backgroundColor = UIColor.blue
                case 2:
                    self.sketchView.backgroundColor = UIColor.green
                case 3:
                    self.sketchView.backgroundColor = UIColor.black
                default:
                    break
                }})
            .map{ "\($0)" }
            .bind(to: countLabel.rx.text)
            .disposed(by: disposeBag)
        
        changeBtn.rx.tap
            .bind(to: viewModel.changeCount)
            .disposed(by: disposeBag)
//        nextBtn.rx.tap
//            .asDriver()
//            .drive(onNext: { [weak self] in
//                let newLoginVC = AppStoryboard.main.instance.instantiateViewController(withIdentifier: VC.newLogin.rawValue)
//                                    as! NewLoginViewController
//                self?.navigationController?.pushViewController(newLoginVC, animated: true)
//            })
//            .disposed(by: disposeBag)
        
        nextBtn.rx.tap
            .bind(onNext: { [weak self] in
                let newLoginVC = AppStoryboard.main.instance.instantiateViewController(withIdentifier: VC.newLogin.rawValue)
                    as! NewLoginViewController
                self?.navigationController?.pushViewController(newLoginVC, animated: true)
            })
            .disposed(by: disposeBag)
    }
    


}
