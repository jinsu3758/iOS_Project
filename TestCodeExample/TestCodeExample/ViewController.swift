//
//  ViewController.swift
//  TestCodeExample
//
//  Created by 박진수 on 2020/06/02.
//  Copyright © 2020 박진수. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print(convertToPrice(value: 1000000))
        // Do any additional setup after loading the view.
    }
    
    func convertToPrice(value: Int) -> String {
        var valueString = String(value)
        var count = valueString.count
        let commaCount = (count % 3) == 0 ? count / 3 - 1 : count / 3
        
        for _ in 0..<commaCount {
            count -= 3
            valueString.insert(",", at: valueString.index(valueString.startIndex, offsetBy: count))
        }
        return valueString
    }


}

