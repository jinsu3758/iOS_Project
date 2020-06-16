//
//  UIViewController.swift
//  RxMemo
//
//  Created by 박진수 on 2020/06/16.
//  Copyright © 2020 박진수. All rights reserved.
//

import UIKit

extension UIViewController {
    var sceneViewController: UIViewController {
        return self.children.first ?? self
    }
}
