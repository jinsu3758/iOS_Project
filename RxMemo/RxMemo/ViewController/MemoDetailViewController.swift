//
//  MemoDetailViewController.swift
//  RxMemo
//
//  Created by 박진수 on 2020/06/11.
//  Copyright © 2020 박진수. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import Action


class MemoDetailViewController: UIViewController, ViewModelBindableType {
    @IBOutlet weak var listTableView: UITableView!
    @IBOutlet weak var deleteBtn: UIBarButtonItem!
    @IBOutlet weak var editBtn: UIBarButtonItem!
    @IBOutlet weak var shareBtn: UIBarButtonItem!
    
    var viewModel: MemoDetailViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func bindViewModel() {
        viewModel.title
            .drive(navigationItem.rx.title)
            .disposed(by: rx.disposeBag)
        
        viewModel.contents
            .bind(to: listTableView.rx.items) { tableView, row, value in
                switch row {
                case 0:
                    let cell = tableView.dequeueReusableCell(withIdentifier: "contentCell")!
                    cell.textLabel?.text = value
                    return cell
                case 1:
                    let cell = tableView.dequeueReusableCell(withIdentifier: "dateCell")!
                    cell.textLabel?.text = value
                    return cell
                default:
                    fatalError()
                }
        }.disposed(by: rx.disposeBag)
        
        editBtn.rx.action = viewModel.makeEdition()

    }

}
