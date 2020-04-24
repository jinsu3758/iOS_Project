//
//  ListViewItemDetail.swift
//  SwiftUIExample
//
//  Created by 박진수 on 2020/04/23.
//  Copyright © 2020 박진수. All rights reserved.
//

import SwiftUI

struct ListViewItemDetail: View {
    @State var isPresent: Bool = false
    let item: ListViewItem
    
    var body: some View {
        VStack {
            Image(item.imageResource)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .onTapGesture(count: 2) {
                    self.isPresent = true
                }
            Text(item.name)
            
        }.alert(isPresented: $isPresent, content: {
            Alert(title: Text("더블클릭"), message: Text("하셨습니다!"), dismissButton: .default(Text("확인")))
        })
    }
}

struct ListViewItemDetail_Previews: PreviewProvider {
    static let item = ListViewItem(name: "피카츄", imageResource: "ico_down", num: 2)
    static var previews: some View {
        ListViewItemDetail(item: item)
    }
}
