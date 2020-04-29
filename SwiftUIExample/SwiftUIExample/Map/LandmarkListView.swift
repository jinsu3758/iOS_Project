//
//  LandmarkListView.swift
//  SwiftUIExample
//
//  Created by 박진수 on 2020/04/28.
//  Copyright © 2020 박진수. All rights reserved.
//

import SwiftUI

struct LandmarkListView: View {
    @EnvironmentObject var userData: UserData
    
    var body: some View {
        NavigationView {
            
            List {
                Toggle(isOn: $userData.showFavoritesOnly) {
                    Text("Favorites only")
                }
                
                ForEach(userData.landmarks) { landmark in
                    if !self.userData.showFavoritesOnly || landmark.isFavorite {
                        NavigationLink(destination: LandmarkDetailView(landmark: landmark)) {
                            LandmarkRowView(landmark: landmark)
                        }
                    }
                }
            }.navigationBarTitle(Text("랜드마크"))
            
//            List(Constant.landmarkData) { landmark in
//                if !self.showFavoritesOnly || landmark.isFavorite {
//                    NavigationLink(destination: LandmarkDetailView(landmark: landmark)) {
//                        LandmarkRowView(landmark: landmark)
//                    }
//                }
//            }.navigationBarTitle(Text("랜드마크"))
        }
    }
}

struct LandmarkListView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone SE", "iPhone XS"], id: \.self) { deviceName in
            LandmarkListView()
            .environmentObject(UserData())
            .previewDevice(PreviewDevice(rawValue: deviceName))
            .previewDisplayName(deviceName)
        }
    }
}
