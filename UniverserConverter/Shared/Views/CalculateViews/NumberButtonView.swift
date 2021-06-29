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
        }.padding()
    }
}

struct NumberButtonView_Previews: PreviewProvider {
    static var previews: some View {
        NumberButtonView(number: 0)
    }
}
