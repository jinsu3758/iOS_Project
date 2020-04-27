//
//  Landmark.swift
//  SwiftUIExample
//
//  Created by 박진수 on 2020/04/24.
//  Copyright © 2020 박진수. All rights reserved.
//

import Foundation
import SwiftUI
import CoreLocation

enum Category: String, CaseIterable, Codable, Hashable {
    case river = "강"
    case bridge = "다리"
    case museum = "박물관"
}

struct Landmark: Hashable, Codable {
    var id: Int
    var name: String
    fileprivate var imageName: String
    fileprivate var coordinates: Coordinates
    var city: String
    var category: Category
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: coordinates.latitude, longitude: coordinates.longitude)
    }
    
    func image(forSize size: CGSize) -> Image {
        return Image(imageName)
                .resizable()
                .frame(width: size.width, height: size.height) as! Image
    }
    
}


struct Coordinates: Hashable, Codable {
    var latitude: Double
    var longitude: Double
}
