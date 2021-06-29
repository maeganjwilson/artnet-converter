//
//  HistoryView.swift
//  UniverserConverter (iOS)
//
//  Created by Maegan Wilson on 6/29/21.
//

import SwiftUI

struct HistoryView: View {
    var body: some View {
        List{
            HStack{
                VStack{
                    Text("Primary Universe").font(.subheadline)
                    Text("0").font(.system(.title, design: .monospaced))
                }
                Spacer()
                
                VStack{
                        Text("Subnet").font(.subheadline)
                        Text("0").font(.system(.title, design: .monospaced))
                    }
                VStack{
                        Text("Universe").font(.subheadline)
                        Text("0").font(.system(.title, design: .monospaced))
                    }
            }
            HStack{
                VStack{
                    Text("Primary Universe").font(.subheadline)
                    Text("0").font(.system(.title, design: .monospaced))
                }
                Spacer()
                
                VStack{
                        Text("Subnet").font(.subheadline)
                        Text("0").font(.system(.title, design: .monospaced))
                    }
                VStack{
                        Text("Universe").font(.subheadline)
                        Text("0").font(.system(.title, design: .monospaced))
                    }
            }
            HStack{
                VStack{
                    Text("Primary Universe").font(.subheadline)
                    Text("0").font(.system(.title, design: .monospaced))
                }
                Spacer()
                
                VStack{
                        Text("Subnet").font(.subheadline)
                        Text("0").font(.system(.title, design: .monospaced))
                    }
                VStack{
                        Text("Universe").font(.subheadline)
                        Text("0").font(.system(.title, design: .monospaced))
                    }
            }
        }
        
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView()
    }
}
