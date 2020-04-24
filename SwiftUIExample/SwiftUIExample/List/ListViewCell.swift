//
//  ListViewCell.swift
//  SwiftUIExample
//
//  Created by 박진수 on 2020/04/23.
//  Copyright © 2020 박진수. All rights reserved.
//

import SwiftUI

struct ListViewCell: View {
    let item: ListViewItem
    
    var body: some View {
        HStack {
            Image(item.imageResource)
                .resizable()
                .frame(width: 100, height: 100, alignment: .center)
                .cornerRadius(16)
            VStack(alignment: .leading) {
                Text(item.name).font(.largeTitle)
                Text("\(item.num)호")
            }
        }
    }
}

