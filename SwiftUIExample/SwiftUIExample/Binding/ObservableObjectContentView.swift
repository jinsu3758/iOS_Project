//
//  ObservableObjectContentView.swift
//  SwiftUIExample
//
//  Created by 박진수 on 2020/04/23.
//  Copyright © 2020 박진수. All rights reserved.
//

import SwiftUI

struct ObservableObjectContentView: View {
    @ObservedObject var countObject = CountObject()
    
    var body: some View {
        VStack {
            VStack {
                Text("\(countObject.count)").font(.largeTitle)
                Button("숫자 증가") {
                    self.countObject.count += 1
                }
            }
            
            VStack {
                Text("\(countObject.secondCount)").font(.largeTitle)
                Button("2로 나눠지면 표시") {
                    self.countObject.secondCount += 1
                }
            }.padding(20)
            
            VStack {
                Text("\(countObject.thirdCount)").font(.largeTitle)
                Button("세번째 ") {
                    self.countObject.thirdCount += 1
                }
            }.padding(20)
            
            ChildTextView()
            ChildButtonView()
        }
    }
}

struct ObservableObjectContentView_Previews: PreviewProvider {
    static var previews: some View {
        ObservableObjectContentView().environmentObject(CountObject())
    }
}

struct ChildTextView: View {
    @EnvironmentObject var countObject: CountObject
    var body: some View {
        Text("Environment : \(countObject.count)").font(.largeTitle)
    }
}

struct ChildButtonView: View {
    @EnvironmentObject var countObject: CountObject
    var body: some View {
        Button("environment count 증가") {
            self.countObject.count += 1
        }
    }
}

class CountObject: ObservableObject {
    @Published var count: Int = 0
    var secondCount: Int = 0 {
        willSet(newValue) {
            if (newValue % 2 == 0) {
                objectWillChange.send()
            }
        }
    }
    
    var thirdCount: Int = 0
}
