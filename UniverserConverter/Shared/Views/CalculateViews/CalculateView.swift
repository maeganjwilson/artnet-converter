//
//  CalculateView.swift
//  UniverserConverter (iOS)
//
//  Created by Maegan Wilson on 6/29/21.
//

import SwiftUI

struct CalculateView: View {
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Environment(\.verticalSizeClass) var verticalSizeClass
    
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
                        .font(.system(size: 45, weight: .bold, design: .monospaced))
                }
                Spacer()
                VStack(alignment: .trailing){
                    Text("Universe")
                        .font(.subheadline)
                    Text(artnetUniverse)
                        .font(.system(size: 45, weight: .bold, design: .monospaced))
                }
            }
            .padding(.horizontal)
            .padding(.bottom, 5)
            
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
                        .font(.system(size: 12))
                        .frame(width: 65)
                }
                .border(.primary)
                .accentColor(.secondary)
                .toggleStyle(.button)
                
                Spacer()
                
                Toggle(isOn: $isZeroBase){
                    Text("ArtNet is 0 Based")
                        .font(.system(size: 12))
                        .frame(width: 65)
                    
                }
                .border(.primary)
                .accentColor(.secondary)
                .toggleStyle(.button)
                
                Spacer()
                
                Toggle(isOn: $isZeroBase){
                    Text("Primary is 0 Based")
                        .font(.system(size: 12))
                        .frame(width: 65)
                    
                }
                .border(.primary)
                .accentColor(.secondary)
                .toggleStyle(.button)
            }
            .padding(.horizontal)
            .padding(.bottom, 5)
            
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
                    Button(action: {print("<-")}) {
                        ZStack{
                            RoundedRectangle(cornerRadius: 5)
                                .aspectRatio(1.0, contentMode: .fit)
                            Text("DEL")
                                .font(.system(.body, design: .monospaced))
                                .foregroundColor(.primary)
                                .frame(minWidth: 10,
                                       idealWidth: 15,
                                       maxWidth: 50,
                                       minHeight: 10,
                                       idealHeight: 15,
                                       maxHeight: 50,
                                       alignment: .center)
                                .aspectRatio(1.0, contentMode: .fit)
                                .background(.thickMaterial, in: RoundedRectangle(cornerRadius: 5))
                        }
                    }.padding(2)
                        .accentColor(.red)
                    NumberButtonView(number: 0)
                    Button(action: {print("<-")}) {
                        ZStack{
                            RoundedRectangle(cornerRadius: 5)
                                .aspectRatio(1.0, contentMode: .fit)
                            Text("CALC")
                                .font(.system(.body, design: .monospaced))
                                .foregroundColor(.primary)
                                .frame(minWidth: 10,
                                       idealWidth: 15,
                                       maxWidth: 50,
                                       minHeight: 10,
                                       idealHeight: 15,
                                       maxHeight: 50,
                                       alignment: .center)
                                .aspectRatio(1.0, contentMode: .fit)
                                .background(.thickMaterial, in: RoundedRectangle(cornerRadius: 5))
                        }
                    }.padding(2)
                        .accentColor(.green)
                }
            }
        }.onAppear{
            print("H: \(horizontalSizeClass)")
            print("V: \(verticalSizeClass)")
        }
    }
}

struct CalculateView_Previews: PreviewProvider {
    static var previews: some View {
        CalculateView()
    }
}
