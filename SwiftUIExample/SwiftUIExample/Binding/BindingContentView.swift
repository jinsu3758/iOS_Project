//
//  BindingContentView.swift
//  SwiftUIExample
//
//  Created by 박진수 on 2020/04/23.
//  Copyright © 2020 박진수. All rights reserved.
//

import SwiftUI

struct BindingContentView: View {
    // 값이 변동되면 View가 사라지고 새로운 뷰가 만드렁지며 변동된 값을 재참조하는 방식으로 값이 유지
    @State var isToggleOn: Bool = true
    
    var body: some View {
        VStack {
            //$는 프로퍼티 래퍼 자체를 받음
            //WrapperValue 자체를 변경 가능
            Toggle(isOn: $isToggleOn) {
                Text("글자를 가림")
            }.padding(50)
            
            ChildView(isToggleOn: $isToggleOn)
            if isToggleOn {
                Text("This is Text").padding(20)
            }
        }
    }
}

struct BindingContentView_Previews: PreviewProvider {
    static var previews: some View {
        BindingContentView()
    }
}

struct ChildView: View {
    @Binding var isToggleOn: Bool
    
    var body: some View {
        Toggle(isOn: $isToggleOn) {
            Text("글자를 가림")
        }.padding()
    }
}

