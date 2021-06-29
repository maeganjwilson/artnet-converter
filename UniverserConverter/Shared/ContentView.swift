//
//  ContentView.swift
//  Shared
//
//  Created by Maegan Wilson on 6/29/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            CalculateView()
                .tabItem{
                    Image(systemName: "square.grid.3x3")
                }
            Text("History")
                .tabItem{
                    Image(systemName: "book")
                }
            Text("Settings")
                .tabItem{
                    Image(systemName: "info.circle")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
