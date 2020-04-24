//
//  ViewController.swift
//  TestVIewCycle
//
//  Created by 박진수 on 14/03/2019.
//  Copyright © 2019 박진수. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        print("viewWillAppear()!!")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        print("viewDidAppear()!!")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        print("viewWillDisappear()!!")
        let alert = UIAlertController(title: "rerw", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "rerw", style: .default, handler: {
            _ in self.navigationController?.popViewController(animated: true)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        print("viewDidDisappear()!!")
    }


}

