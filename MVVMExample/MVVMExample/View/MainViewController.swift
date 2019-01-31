//
//  ViewController.swift
//  MVVMExample
//
//  Created by 박진수 on 24/01/2019.
//  Copyright © 2019 박진수. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class MainViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var nextBtn: UIButton!
    
    let searchController = UISearchController(searchResultsController: nil)
    var searchBar: UISearchBar { return searchController.searchBar }
    
    let viewModel = MainViewModel()
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setBinding()
    }
    
    func setUI() {
        searchController.obscuresBackgroundDuringPresentation = false
        searchBar.showsCancelButton = true
        searchBar.placeholder = "Enter Github ID"
        tableView.tableHeaderView = searchController.searchBar
        definesPresentationContext = true
    }
    
    func setBinding() {
        viewModel.data.drive(tableView.rx.items(cellIdentifier: "Cell")) { (_, repository, cell) in
            cell.textLabel?.text = repository.name
            cell.detailTextLabel?.text = repository.url
        }
        .disposed(by: disposeBag)
        
        searchBar.rx.text.orEmpty
            .bind(to: viewModel.searchText)
            .disposed(by: disposeBag)
        
        viewModel.data
            .map{ "\($0.count) Repositories"}
            .drive(navigationItem.rx.title)
            .disposed(by: disposeBag)
        
        
        nextBtn.rx.tap.subscribe ( onNext: { [weak self] in
            let numVC = AppStoryboard.main.instance.instantiateViewController(withIdentifier: VC.numVC.rawValue)
                as! NumberViewController
            self?.navigationController?.pushViewController(numVC, animated: true)
        }).disposed(by: disposeBag)
        
    }


}


