//
//  MapContentView.swift
//  SwiftUIExample
//
//  Created by 박진수 on 2020/04/24.
//  Copyright © 2020 박진수. All rights reserved.
//

import SwiftUI

struct LandmarkDetailView: View {
    @EnvironmentObject var userData: UserData
    var landmark: Landmark
    var landmarkIndex: Int {
        userData.landmarks.firstIndex(where: { $0.id == landmark.id })!
    }
    var body: some View {
        VStack {
            MapView(coordinate: landmark.locationCoordinate)
                .edgesIgnoringSafeArea(.top)
                .frame(height: 300)
            
            ImageCustomContentView(image: landmark.image())
                .offset(y: -100)
                .padding(.bottom, -120)
            
            VStack(alignment: .leading) {
                HStack {
                    Text(landmark.name).font(.title)
                    Button(action: { self.userData.landmarks[self.landmarkIndex].isFavorite.toggle() }) {
                        if self.userData.landmarks[self.landmarkIndex].isFavorite {
                            Image(systemName: "star.fill")
                                .foregroundColor(.yellow)
                        }
                        else {
                            Image(systemName: "star")
                                .foregroundColor(.gray)
                        }
                    }
                }
                
                HStack {
                    Text(landmark.address).font(.subheadline)
                        .foregroundColor(Color.init(UIColor.gray.withAlphaComponent(0.8)))
                    Spacer()
                    Text(landmark.city).font(.subheadline)
                        .foregroundColor(Color.init(UIColor.gray.withAlphaComponent(0.8)))
                }
            }.padding()
            
            Spacer()
        }
        .navigationBarTitle(Text(landmark.name), displayMode: .inline)
    }
}

struct MapContentView_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkDetailView(landmark: Constant.landmarkData[0])
            .environmentObject(UserData())
    }
}
