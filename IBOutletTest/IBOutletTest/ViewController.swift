//
//  ViewController.swift
//  IBOutletTest
//
//  Created by 박진수 on 2021/01/07.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imagView: UIImageView! {
        didSet {
            print("didSet")
            imagView.image = UIImage(systemName: "star")
        }
    }
    
    var mutableStruct: MutableStruct = MutableStruct() {
        didSet {
            print("\(mutableStruct.item)")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func action(_ sender: Any) {
//        imagView = UIImageView(image: UIImage(systemName: "pencil"))
//        let a = UIImageView(image: UIImage(systemName: "pencil"))
//        imagView = a
//        imagView.tag = 5
//        mutableStruct.change()
        mutableStruct.item = "change"
//        mutableStruct.change()
    }

}

struct MutableStruct {
    var item: String = "immutable"
    
    init() {}
    
    mutating func change() {
        self.item = "mutable"
    }
}

