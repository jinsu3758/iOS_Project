//
//  NavigationBarModifier.swift
//  SwiftUIExample
//
//  Created by 박진수 on 2020/05/07.
//  Copyright © 2020 박진수. All rights reserved.
//

import SwiftUI

struct NavigationBarModifier: ViewModifier {
    var backgroundColor: UIColor?
    
    init(backgroundColor: UIColor?) {
        self.backgroundColor = backgroundColor
        let coloredAppereance = UINavigationBarAppearance()
        coloredAppereance.configureWithTransparentBackground()
        coloredAppereance.backgroundColor = .clear
        coloredAppereance.titleTextAttributes = [.foregroundColor: UIColor.white]
        coloredAppereance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
        UINavigationBar.appearance().standardAppearance = coloredAppereance
        UINavigationBar.appearance().compactAppearance = coloredAppereance
        UINavigationBar.appearance().scrollEdgeAppearance = coloredAppereance
        UINavigationBar.appearance().tintColor = .white
        
    }
    
    func body(content: Content) -> some View {
        ZStack {
            content
            VStack {
                GeometryReader { geometry in
                    Color(self.backgroundColor ?? .clear)
                        .frame(height: geometry.safeAreaInsets.top)
                        .edgesIgnoringSafeArea(.top)
                    Spacer()
                }
            }
        }
    }
}
