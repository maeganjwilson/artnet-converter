//
//  ContentView.swift
//  uni-converter
//
//  Created by Maegan Wilson on 8/29/19.
//  Copyright © 2019 MW. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var selection = 0
 
    var body: some View {
        TabView(selection: $selection){
            CalculateView()
                .tabItem {
                    VStack {
                        Image(systemName: "square.grid.2x2")
                        Text("Calc")
                    }
                }
                .tag(0)
            Text("Second View")
                .font(.title)
                .tabItem {
                    VStack {
                        Image(systemName: "list.dash")
                        Text("History")
                    }
                }
                .tag(1)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}