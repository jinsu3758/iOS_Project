//
//  Constant.swift
//  SwiftUIExample
//
//  Created by 박진수 on 2020/04/29.
//  Copyright © 2020 박진수. All rights reserved.
//

import Foundation

struct Constant {
    static var landmarkData: [Landmark] {
        var landmark: [Landmark] = []
        JSJsonDecoder.shared.decode(completion: { (item: [Landmark]?, error) in
            guard let item = item else { return }
            landmark = item
        })
        return landmark
    }
}
