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
                default:
                    break
                }})
            .map{ "\($0)" }
            .bind(to: countLabel.rx.text)
            .disposed(by: disposeBag)
        
//        viewModel.count.asObservable()
//            .subscribe({ count in
//                if let cnt = count.element {
//                    switch(cnt) {
//                    case 0:
//                        self.sketchView.backgroundColor = UIColor.red
//                    case 1:
//                        self.sketchView.backgroundColor = UIColor.blue
//                    case 2:
//                        self.sketchView.backgroundColor = UIColor.green
//                    default:
//                        break
//                    }
//                }
//            }).disposed(by: disposeBag)
        
        
        changeBtn.rx.tap
            .bind(to: viewModel.changeCount)
            .disposed(by: disposeBag)
        
        
    }
    


}
