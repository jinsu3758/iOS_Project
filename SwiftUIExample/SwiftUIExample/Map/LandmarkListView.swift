//
//  LandmarkListView.swift
//  SwiftUIExample
//
//  Created by 박진수 on 2020/04/28.
//  Copyright © 2020 박진수. All rights reserved.
//

import SwiftUI

struct LandmarkListView: View {
    var landmarkData: [Landmark] {
        var landmark: [Landmark] = []
        do {
            if let file = Bundle.main.url(forResource: "landmark", withExtension: "json") {
                let contents = try String(contentsOf: file)
                print("\(contents)")
                let data = try Data(contentsOf: file)
                landmark = try JSONDecoder().decode([Landmark].self, from: data)
            }
            
        }
        catch {
            
        }
        return landmark
    }
    
    var body: some View {
        NavigationView {
            List(landmarkData) { landmark in
                NavigationLink(destination: LandmarkDetailView(landmark: landmark)) {
                    LandmarkRowView(landmark: landmark)
                }
            }.navigationBarTitle(Text("랜드마크"))
        }
    }
}

struct LandmarkListView_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkListView()
    }
}
