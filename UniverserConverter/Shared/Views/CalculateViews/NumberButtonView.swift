//
//  NumberButtonView.swift
//  UniverserConverter (iOS)
//
//  Created by Maegan Wilson on 6/29/21.
//

import SwiftUI

struct NumberButtonView: View {
    var number: Int
    var body: some View {
        Button(action: {print("\(number)")}) {
            ZStack{
                RoundedRectangle(cornerRadius: 5)
                    .aspectRatio(1.0, contentMode: .fit)
                Text("\(number)")
                    .font(.system(.body, design: .monospaced))
                    .foregroundColor(.primary)
                    .frame(minWidth: 5,
                           idealWidth: 10,
                           maxWidth: 50,
                           minHeight: 5,
                           idealHeight: 10,
                           maxHeight: 50,
                           alignment: .center)
                    .aspectRatio(1.0, contentMode: .fit)
                    .background(.thickMaterial, in: RoundedRectangle(cornerRadius: 5))
            }
        }.padding(2)
    }
}

struct NumberButtonView_Previews: PreviewProvider {
    static var previews: some View {
        NumberButtonView(number: 0)
    }
}
