//
//  ViewExtension.swift
//  SwiftUIExample
//
//  Created by 박진수 on 2020/05/07.
//  Copyright © 2020 박진수. All rights reserved.
//

import SwiftUI

extension View {
    func navigationBarColor(_ backGroundColor: UIColor?) -> some View {
        self.modifier(NavigationBarModifier(backgroundColor: backGroundColor))
    }
}
