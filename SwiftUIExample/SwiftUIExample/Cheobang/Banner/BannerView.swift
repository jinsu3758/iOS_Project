//
//  BannerView.swift
//  SwiftUIExample
//
//  Created by 박진수 on 2020/05/06.
//  Copyright © 2020 박진수. All rights reserved.
//

import SwiftUI

struct BannerView: View {
    let mainWidth: CGFloat = UIScreen.main.bounds.width
    
    init() {
        UINavigationBar.appearance().backgroundColor = .blue
        UINavigationBarAppearance().backgroundColor = .blue
        UIScrollView.appearance().bounces = false
    }
    var body: some View {
        NavigationView {
            //            ZStack {
            List {
                ScrollView(.horizontal, showsIndicators: false ,content:  {
                    HStack(spacing: 16) {
                        ForEach((0...10).reversed(), id: \.self) { _ in
                            BannerItemView(banner: Banner(id: 1, content: "처방해줌"))
                                .frame(width: self.mainWidth - 32, height: 139, alignment: .center)
                                .background(Color.white)
                        }
                    }
                    
                })
                    .padding(.leading, 16)
                    .listRowInsets(EdgeInsets())
                    .frame(height: 190)
                    .background(Color(UIColor.blue))
                
            }
            .navigationBarItems(leading:
                HStack {
                    Image("navigationBar")
                }
                .padding(UIScreen.main.bounds.width / 4)
                ,trailing:
                       HStack {
                           Button(action: {
                               
                           }) {
                               Image("icGnbMy")
                           }
                       }.foregroundColor(.white)
                   )
                .navigationBarTitle("", displayMode: .inline)
                
            //                    .background(Color.blue)
            //            }
        }
        .navigationBarColor(.blue)
        
        
        
        
        
    }
}

struct BannerView_Previews: PreviewProvider {
    static var previews: some View {
        BannerView()
    }
}
