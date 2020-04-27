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
            landmark.image(forSize: CGSize(width: 50, height: 50))
            Text(landmark.name)
        }
        
    }
}

struct LandmarkRowView_Previews: PreviewProvider {
    static var landmarkData: [Landmark] {
        var landmark: [Landmark] = []
        do {
            if let file = Bundle.main.url(forResource: "landmark", withExtension: "json") {
                let data = try Data(contentsOf: file)
                landmark = try JSONDecoder().decode([Landmark].self, from: data)
            }
            
        }
        catch {
            
        }
        return landmark
    }
    static var previews: some View {
        LandmarkRowView(landmark: landmarkData[0])
            .previewLayout(.fixed(width: 300, height: 70))
    }
}
