//
//  AppDIContainer.swift
//  CleanArchitecture
//
//  Created by 박진수 on 2020/08/12.
//  Copyright © 2020 jinsu. All rights reserved.
//

import Foundation

final class AppDIContainer {
    func makeUserDIContainer() -> UserDIContainer {
        return UserDIContainer()
    }
}