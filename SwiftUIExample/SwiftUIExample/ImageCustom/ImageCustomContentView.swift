//
//  ImageCustomContentView.swift
//  SwiftUIExample
//
//  Created by 박진수 on 2020/04/24.
//  Copyright © 2020 박진수. All rights reserved.
//

import SwiftUI

struct ImageCustomContentView: View {
    var image: Image
    
    var body: some View {
        image
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
        ImageCustomContentView(image: Image("art"))
    }
}
