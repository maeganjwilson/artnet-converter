//
//  CalculateView.swift
//  UniverserConverter (iOS)
//
//  Created by Maegan Wilson on 6/29/21.
//

import SwiftUI

struct CalculateView: View {
    @State private var isShowingHex = true
    @State private var isZeroBase = false
    @State private var primaryUniverse = "001"
    @State private var artnetSubnet = "0"
    @State private var artnetUniverse = "0"
    
    var body: some View {
        VStack{
            // Subnet and Universe
            HStack{
                VStack(alignment: .leading){
                    Text("Subnet")
                        .font(.subheadline)
                    Text(artnetSubnet)
                        .font(.system(size: 50, weight: .bold, design: .monospaced))
                }
                Spacer()
                VStack(alignment: .trailing){
                    Text("Universe")
                        .font(.subheadline)
                    Text(artnetUniverse)
                        .font(.system(size: 50, weight: .bold, design: .monospaced))
                }
            }.padding()
            Spacer()
            // Primary Universe
            VStack(alignment: .leading){
                Text("Primary Universe")
                    .font(.subheadline)
                TextField("Primary Universe", text: $primaryUniverse)
                    .font(.system(.title, design: .monospaced))
            }.padding()
            // Settings
            HStack{
                Toggle(isOn: $isShowingHex){
                    Text("ArtNet is Hex")
                        .frame(width: 100)
                }
                .border(.primary)
                .accentColor(.secondary)
                .toggleStyle(.button)
                
                Spacer()
                
                Toggle(isOn: $isZeroBase){
                    Text("Primary is 0 Based")
                        .frame(width: 100)
                    
                }
                .border(.primary)
                .accentColor(.secondary)
                .toggleStyle(.button)
                
                Spacer()
                
                Toggle(isOn: $isZeroBase){
                    Text("ArtNet is 0 Based")
                        .frame(width: 100)
                    
                }
                .border(.primary)
                .accentColor(.secondary)
                .toggleStyle(.button)
            }
            .padding(10)
            
            // Numberpad
            VStack{
                HStack{
                    NumberButtonView(number: 7)
                    NumberButtonView(number: 8)
                    NumberButtonView(number: 9)
                }
                HStack{
                    NumberButtonView(number: 4)
                    NumberButtonView(number: 5)
                    NumberButtonView(number: 6)
                }
                
                HStack{
                    NumberButtonView(number: 1)
                    NumberButtonView(number: 2)
                    NumberButtonView(number: 3)
                }
                
                HStack{
                    NumberButtonView(number: 0)
                }
            }
        }
    }
}

struct CalculateView_Previews: PreviewProvider {
    static var previews: some View {
        CalculateView()
    }
}
