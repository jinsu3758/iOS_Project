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
    case river
    case bridge
    case museum
}

struct Landmark: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    fileprivate var imageName: String
    fileprivate var coordinates: Coordinates
    var city: String
    var category: Category
    var address: String
    var isFavorite: Bool
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: coordinates.latitude, longitude: coordinates.longitude)
    }
    
    func image() -> Image {
        return Image(imageName)
    }
    
}


struct Coordinates: Hashable, Codable {
    var latitude: Double
    var longitude: Double
}
