//
//  CalculateView.swift
//  uni-converter
//
//  Created by Maegan Wilson on 8/29/19.
//  Copyright © 2019 MW. All rights reserved.
//
import Foundation
import SwiftUI

struct CalculateView: View {
  @EnvironmentObject var calcManager: CalculationManager
  @EnvironmentObject var settingsManager: SettingsManager
  
  var body: some View {
    VStack {
      HStack {
        UniverseView(isPrimeUni: true, uni: calcManager.outputPrimaryUniverse)
        Spacer()
        Group{
          SubView(sub: calcManager.subnet)
            .padding(.trailing)
          UniverseView(uni: calcManager.art_uni)
        }
      }
      .padding(.horizontal)
      .padding(.top, 50)
      Spacer()
      AllButtons()
        .padding(.bottom, 50)
    }.onAppear{
      if self.calcManager.outputPrimaryUniverse <= 1 {
        print(self.settingsManager.zeroArt)
        self.calcManager.setNum(art: self.settingsManager.returnZeroOrOne(self.settingsManager.zeroArt))
        self.calcManager.setNum(primUni: self.settingsManager.returnZeroOrOne(self.settingsManager.zeroUni))
      }
    }
  }
}
