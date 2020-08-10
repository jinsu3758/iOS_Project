//
//  Meal.swift
//  TestCodeExample
//
//  Created by 박진수 on 2020/06/04.
//  Copyright © 2020 박진수. All rights reserved.
//

import Foundation
import UIKit

class Meal {
    var name = ""
    var photo: UIImage?
    var rating = 0
    
    init?(name: String, photo: UIImage?, rating: Int) {
        if name.isEmpty {
            return nil
        }
    }
//
    convenience init?() {
        self.init(name: "Unknown", photo: nil, rating: 0)
    }
}
