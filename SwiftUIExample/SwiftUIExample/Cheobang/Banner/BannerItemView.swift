//
//  BannerItemView.swift
//  SwiftUIExample
//
//  Created by 박진수 on 2020/05/06.
//  Copyright © 2020 박진수. All rights reserved.
//

import SwiftUI

struct BannerItemView: View {
    var banner: Banner
    
    var body: some View {
        HStack(alignment: .center, spacing: 0) {
            Image("banner")
            .resizable()
            .frame(width: 84, height: 84)
//                .padding(.leading, 32)
                
            
            VStack(alignment: .leading, spacing: 0) {
                Text(banner.content)
                    .font(.system(size: 17))
                    .foregroundColor(Color.blue)
                    .padding(.trailing, 34)
                    .padding(.bottom, 12)
                    
                Text("원격처방 더 알아보기 >")
                    .font(.system(size: 14))
                    .foregroundColor(Color.blue)
                
            }.padding(.leading, 22)
        }
    }
}

struct BannerItemView_Previews: PreviewProvider {
    static var previews: some View {
        BannerItemView(banner: Banner(id: 1, content: "처방해줌"))
            .previewLayout(.fixed(width: 350, height: 139))
    }
}
