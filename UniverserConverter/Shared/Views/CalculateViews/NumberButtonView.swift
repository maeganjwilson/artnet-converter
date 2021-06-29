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
                Text("\(number)")
                    .foregroundColor(.primary)
                    .frame(width: 30, height: 30, alignment: .center)
                    .background(.thickMaterial, in: RoundedRectangle(cornerRadius: 5))
            }.frame(width: 60, height: 60)
        }
    }
}

struct NumberButtonView_Previews: PreviewProvider {
    static var previews: some View {
        NumberButtonView(number: 0)
    }
}
