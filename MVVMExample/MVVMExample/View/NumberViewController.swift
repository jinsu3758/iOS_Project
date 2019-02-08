//
//  NumberViewController.swift
//  MVVMExample
//
//  Created by 박진수 on 28/01/2019.
//  Copyright © 2019 박진수. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class NumberViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var changeBtn: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    
    let viewModel = NumberViewModel()
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBinding()
    }
    
    func setBinding() {
        viewModel.num.map{ "\($0)" }.asDriver(onErrorJustReturn: "error")
            .drive(label.rx.text)
//            .bind(to: label.rx.text)
            .disposed(by: disposeBag)
        
        changeBtn.rx.tap
            .bind(to: viewModel.didTapRelay)
            .disposed(by: disposeBag)
        
//        nextBtn.rx.tap
//            .subscribe(onNext: { [weak self] in
//            let colorVC = AppStoryboard.main.instance.instantiateViewController(withIdentifier: VC.color.rawValue)
//                as! ColorViewController
//            self?.navigationController?.pushViewController(colorVC, animated: true)})
//            .disposed(by: disposeBag)
        
        nextBtn.rx.tap
            .bind(onNext: { [weak self] in
                let colorVC = AppStoryboard.main.instance.instantiateViewController(withIdentifier: VC.color.rawValue)
                    as! ColorViewController
                self?.navigationController?.pushViewController(colorVC, animated: true)
            })
            .disposed(by: disposeBag)
//        nextBtn.rx.tap
//            .asDriver()
//            .drive(onNext: {  [weak self] in
//                let colorVC = AppStoryboard.main.instance.instantiateViewController(withIdentifier: VC.color.rawValue)
//                    as! ColorViewController
//                self?.navigationController?.pushViewController(colorVC, animated: true)
//                })
//            .disposed(by: disposeBag)
    }


}
