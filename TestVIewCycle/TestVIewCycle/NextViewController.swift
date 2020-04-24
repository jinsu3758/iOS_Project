//
//  NextViewController.swift
//  TestVIewCycle
//
//  Created by 박진수 on 14/03/2019.
//  Copyright © 2019 박진수. All rights reserved.
//

import UIKit

class NextViewController: UIViewController {

    convenience init(){
        self.init()
        print("next init()!!")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
