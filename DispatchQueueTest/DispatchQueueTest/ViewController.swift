//
//  ViewController.swift
//  DispatchQueueTest
//
//  Created by 박진수 on 2021/01/18.
//

import UIKit

class ViewController: UIViewController {
    let concurrent = DispatchQueue.global()   // concurrent
    let main = DispatchQueue.main  // main
    let serial = DispatchQueue.init(label: "test")    // serial
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        serial_test()
    }


    func main_test() {
//        main.async {
//            print("main async")
//        }
        for i in 0...500 {
            print(i)
        }
        
        // 무조건 main이 먼저
    }
    
    func serial_test() {
        serial.sync {
            for i in 1...100 {
                print(i)
            }
            serial.sync {
                print("555")
            }
        }
        
    }
}

