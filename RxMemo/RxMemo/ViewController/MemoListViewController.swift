//
//  MemoListViewController.swift
//  RxMemo
//
//  Created by 박진수 on 2020/06/11.
//  Copyright © 2020 박진수. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import NSObject_Rx
import RxDataSources

class MemoListViewController: UIViewController, ViewModelBindableType {
    @IBOutlet weak var memoListTableView: UITableView!
    @IBOutlet weak var addMemoBtn: UIBarButtonItem!
    
    var viewModel: MemoListViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func bindViewModel() {
        viewModel.title
            .drive(navigationItem.rx.title)
            .disposed(by: rx.disposeBag)
        
        viewModel.memoList
            .bind(to: memoListTableView.rx.items(dataSource: viewModel.dataSource))
            .disposed(by: rx.disposeBag)
        
        addMemoBtn.rx.action = viewModel.makeCreateAction()
        
        Observable.zip(memoListTableView.rx.modelSelected(Memo.self), memoListTableView.rx.itemSelected)
            .do(onNext: { [unowned self] (_, indexPath) in
                self.memoListTableView.deselectRow(at: indexPath, animated: true)
            })
            .map { $0.0 }
            .bind(to: viewModel.detailAction.inputs)
            .disposed(by: rx.disposeBag)
        
        memoListTableView.rx.modelDeleted(Memo.self)
            .bind(to: viewModel.deleteAction.inputs)
            .disposed(by: rx.disposeBag)
        
        
        
            
    }

}
