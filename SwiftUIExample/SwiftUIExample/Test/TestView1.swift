//
//  TestView1.swift
//  SwiftUIExample
//
//  Created by 박진수 on 2020/05/07.
//  Copyright © 2020 박진수. All rights reserved.
//

import SwiftUI

struct People: Identifiable{
    var id  = UUID()
    var name = String()
}

struct TestView1: View {
    // 2.
    let people: [People] = [
        People(name: "Bill"),
        People(name: "Jacob"),
        People(name: "Olivia")]
    
    var body: some View {
        NavigationView {
            // 3.
            List(people) { listedPeople in
                NavigationLink(destination: DetailView(name: listedPeople.name)) {
                    VStack(alignment: .leading){
                        Text(listedPeople.name)
                    }
                }
            }
            // 4.
            .navigationBarItems(leading:
            HStack {
                Button(action: {}) {
                    Image(systemName: "minus.square.fill")
                        .font(.largeTitle)
                }.foregroundColor(.pink)
            }, trailing:
            HStack {
                Button(action: {}) {
                    Image(systemName: "plus.square.fill")
                        .font(.largeTitle)
                }.foregroundColor(.blue)
            })
                // 5.
                .navigationBarTitle(Text("Names"))
        }
    }
}
struct DetailView: View {
    var name: String
    
    var body: some View {
        Text("current name is: \(name) ")
         // 7.
        .navigationBarTitle(Text("Current Name"), displayMode: .inline)
    }
}

struct TestView1_Previews: PreviewProvider {
    static var previews: some View {
        TestView1()
    }
}
