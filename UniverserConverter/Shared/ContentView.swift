//
//  ContentView.swift
//  Shared
//
//  Created by Maegan Wilson on 6/29/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NumberButtonView(number: 1)
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
