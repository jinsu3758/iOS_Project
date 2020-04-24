//
//  ContentView.swift
//  SwiftUIExample
//
//  Created by 박진수 on 20/04/2020.
//  Copyright © 2020 박진수. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    // State 어노테이션이 붙은 변수는 변경이 일어나면 자동으로 View를 렌더링함
    @State var touchedCount: Int = 0
    @State var name: String = ""
    @State var age: String = ""
    @State var dateBirth: Int = 0
    @State var gender: Int = 0
    let genderType = ["남성", "여성", "3성"]
    
    var body: some View {
        NavigationView {
            Form {
                Group {
                    Section(header: Text("이름")) {
                        TextField("이름을 입력해주세요", text: $name)
                        .keyboardType(.default)
                    }
                    Section(header: Text("생년월일")) {
                        Picker("출생년도", selection: $dateBirth) {
                            ForEach(1930 ..< 2010) {
                                Text("\(String($0))년생")
                            }
                        }
                    }
                    
                    Section(header: Text("성별")) {
                        Picker("성별", selection: $gender) {
                            ForEach(0 ..< genderType.count) {
                                Text("\(self.genderType[$0])")
                            }
                        }.pickerStyle(SegmentedPickerStyle())
                    }
                    
                    Section {
                        Text("\(name)의 나이는 \(Calendar.current.component(.year, from: Date()) - (1930 + dateBirth - 1)) 성별은 \(genderType[gender])")
                    }
                    
                    Text("count : \(touchedCount)")
                    Button("Count") {
                        self.touchedCount += 1
                    }
                }
                
            }.navigationBarTitle("SwiftUI")
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

