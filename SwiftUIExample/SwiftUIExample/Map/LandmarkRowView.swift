//
//  LandmarkRowView.swift
//  SwiftUIExample
//
//  Created by 박진수 on 2020/04/27.
//  Copyright © 2020 박진수. All rights reserved.
//

import SwiftUI

struct LandmarkRowView: View {
    var landmark: Landmark
    
    var body: some View {
        HStack {
            landmark.image()
                .resizable()
                .frame(width: 90, height: 70)
            Text(landmark.name)
            Spacer()
            
            if landmark.isFavorite {
                Image(systemName: "star.fill")
                    .imageScale(.medium)
                    .foregroundColor(.yellow)
            }
        }
        
    }
}

struct LandmarkRowView_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkRowView(landmark: Constant.landmarkData[0])
            .previewLayout(.fixed(width: 300, height: 70))
    }
}
