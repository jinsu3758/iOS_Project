//
//  MapContentView.swift
//  SwiftUIExample
//
//  Created by 박진수 on 2020/04/24.
//  Copyright © 2020 박진수. All rights reserved.
//

import SwiftUI

struct LandmarkDetailView: View {
    var landmark: Landmark
    var body: some View {
        VStack {
            MapView(coordinate: landmark.locationCoordinate)
                .edgesIgnoringSafeArea(.top)
                .frame(height: 300)
            
            ImageCustomContentView(image: landmark.image())
                .offset(y: -100)
                .padding(.bottom, -120)
            
            VStack(alignment: .leading) {
                Text(landmark.name).font(.title)
                
                HStack {
                    Text(landmark.city).font(.subheadline)
                        .foregroundColor(Color.init(UIColor.gray.withAlphaComponent(0.8)))
                    Spacer()
                    Text(landmark.city).font(.subheadline)
                        .foregroundColor(Color.init(UIColor.gray.withAlphaComponent(0.8)))
                }
            }.padding()
            
            Spacer()
        }
    }
}

struct MapContentView_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkDetailView(landmark: Landmark())
    }
}
