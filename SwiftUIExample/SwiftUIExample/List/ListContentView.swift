//
//  ListContentView.swift
//  SwiftUIExample
//
//  Created by 박진수 on 2020/04/22.
//  Copyright © 2020 박진수. All rights reserved.
//

import SwiftUI

struct ListContentView: View {
    let list: [ListViewItem] = [
        ListViewItem(name: "피카츄", imageResource: "ico_down", num: 1),
        ListViewItem(name: "피카츄", imageResource: "ico_down", num: 1),
        ListViewItem(name: "피카츄", imageResource: "ico_down", num: 1),
        ListViewItem(name: "피카츄", imageResource: "ico_down", num: 1),
        ListViewItem(name: "피카츄", imageResource: "ico_down", num: 1),
        ListViewItem(name: "피카츄", imageResource: "ico_down", num: 1),
        ListViewItem(name: "피카츄", imageResource: "ico_down", num: 1),
        ListViewItem(name: "피카츄", imageResource: "ico_down", num: 1),
        ListViewItem(name: "피카츄", imageResource: "ico_down", num: 1),
        ListViewItem(name: "피카츄", imageResource: "ico_down", num: 1),
        ListViewItem(name: "피카츄", imageResource: "ico_down", num: 1),
        ListViewItem(name: "피카츄", imageResource: "ico_down", num: 1),
        ListViewItem(name: "피카츄", imageResource: "ico_down", num: 1)
    ]
    
    var body: some View {
        NavigationView {
            List(self.list, id: \.name) { item in
                NavigationLink(destination: ListViewItemDetail(item: item)) {
                    ListViewCell(item: item)
                }
            }
        }.navigationBarTitle("포켓몬고", displayMode: .inline)
    }
}

struct ListContentView_Previews: PreviewProvider {
    static var previews: some View {
        ListContentView()
    }
}

