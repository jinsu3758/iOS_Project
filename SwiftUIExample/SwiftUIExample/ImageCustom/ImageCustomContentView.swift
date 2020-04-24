//
//  ImageCustomContentView.swift
//  SwiftUIExample
//
//  Created by 박진수 on 2020/04/24.
//  Copyright © 2020 박진수. All rights reserved.
//

import SwiftUI

struct ImageCustomContentView: View {
    var body: some View {
        Image("art")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 300, height: 180, alignment: .center)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 2))
            .shadow(radius: 5)
    }
}

struct ImageCustomContentView_Previews: PreviewProvider {
    static var previews: some View {
        ImageCustomContentView()
    }
}
