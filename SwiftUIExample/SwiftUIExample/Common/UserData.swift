//
//  UserData.swift
//  SwiftUIExample
//
//  Created by 박진수 on 2020/04/29.
//  Copyright © 2020 박진수. All rights reserved.
//

import SwiftUI

final class UserData: ObservableObject {
    @Published var showFavoritesOnly = false
    @Published var landmarks = Constant.landmarkData
}

