//
//  MapContentView.swift
//  SwiftUIExample
//
//  Created by 박진수 on 2020/04/24.
//  Copyright © 2020 박진수. All rights reserved.
//

import SwiftUI

struct LandmarkDetailView: View {
    var body: some View {
        VStack {
            MapView()
                .edgesIgnoringSafeArea(.top)
                .frame(height: 300)
            
            ImageCustomContentView()
                .offset(y: -100)
                .padding(.bottom, -120)
            
            VStack(alignment: .leading) {
                Text("예술의 전당").font(.title)
                
                HStack {
                    Text("서울 서초구 남부순환로 2406 예술의전당").font(.subheadline)
                        .foregroundColor(Color.init(UIColor.gray.withAlphaComponent(0.8)))
                    Spacer()
                    Text("서울특별시").font(.subheadline)
                        .foregroundColor(Color.init(UIColor.gray.withAlphaComponent(0.8)))
                }
            }.padding()
            
            Spacer()
        }
    }
}

struct MapContentView_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkDetailView()
    }
}
