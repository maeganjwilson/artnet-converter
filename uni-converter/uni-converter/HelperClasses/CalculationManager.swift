//
//  CalculationManager.swift
//  uni-converter
//
//  Created by Maegan Wilson on 8/29/19.
//  Copyright © 2019 MW. All rights reserved.
//

import Foundation
import CoreData
import Combine

class CalculationManager: ObservableObject {
  let set: SettingsManager
  let objectWillChange = ObservableObjectPublisher()
  let managedContext: NSManagedObjectContext
  var mostRecentCalc: CalcEntity
  
  public var prim_uni: Int = 0 {
    willSet {
      self.objectWillChange.send()
    }
  }
  public var subnet: Int = 0 {
    willSet {
      self.objectWillChange.send()
    }
  }
  public var art_uni: Int = 0 {
    willSet {
      self.objectWillChange.send()
    }
  }
  public var calcs: [CalcEntity] = [] {
    willSet {
      self.objectWillChange.send()
    }
  }
  
  init(mc: NSManagedObjectContext, settings: SettingsManager){
    managedContext = mc
    mostRecentCalc = CalcEntity(context: managedContext)
    self.set = SettingsManager()
  }
  
  func setNum(primUni: Int){
    prim_uni = primUni
  }
  func setNum(art: Int){
    art_uni = art
    subnet = art
  }
  
  /// Adds a number to the primary universe like in a calculator
  /// - Parameter num: This is the number to add
  func addNumberToPrimUni(_ num: Int){
    let universe: Bool = !set.returnDefaults("zeroUni")
    let art: Bool = !set.returnDefaults("zeroArt")
    let originalStr = "\(prim_uni)"
    let newStr = originalStr + "\(num)"
    
    prim_uni = Int(newStr)!
    
    if prim_uni > 255 {
      prim_uni = 255
    }
    
    calcAll(uniIsZero: universe, artIsZero: art)
  }
  
  func deleteNumberFromPrimUni(_ num: Int){
    let universe: Bool = !set.returnDefaults("zeroUni")
    let art: Bool = !set.returnDefaults("zeroArt")
    if prim_uni < 10 {
      prim_uni = 0
    } else {
      var originalStr = "\(prim_uni)"
      originalStr.removeLast()
      
      prim_uni = Int(originalStr)!
    }
    
    calcAll(uniIsZero: universe, artIsZero: art)
  }
  
  func setPimUni(to num: Int){
    let universe: Bool = !set.returnDefaults("zeroUni")
    let art: Bool = !set.returnDefaults("zeroArt")
    prim_uni = num
    calcAll(uniIsZero: universe, artIsZero: art)
  }
  
  func calcSub(){
    subnet = (prim_uni/16)
  }
  
  func calcArtUni(){
    art_uni = (prim_uni % 16)
  }
  
  func calcAll(uniIsZero: Bool, artIsZero: Bool){
    
    if prim_uni == 0 {
      art_uni = 0
      subnet = 0
    } else {
      calcSub()
      calcArtUni()
    }
  }
  
  func saveCalculation() {
    
    let newCalc = CalcEntity(context: managedContext)
    newCalc.artuni = Int64(art_uni)
    newCalc.subnet = Int64(subnet)
    newCalc.priuni = Int64(prim_uni)
    newCalc.id = UUID()
    newCalc.date = Date()
    newCalc.isZeroUni = true
    newCalc.isZeroArt = true
    
    do {
      try self.managedContext.save()
      self.mostRecentCalc = newCalc
      self.getCalcs()
    } catch {
      print(error)
    }
  }
  
  func deleteCalc() {
    self.managedContext.delete(mostRecentCalc)
    do {
      try self.managedContext.save()
      self.getCalcs()
    } catch {
      print(error)
    }
  }
  
  func deleteCalc(_ calcEnt: CalcEntity) {
    self.managedContext.delete(calcEnt)
    do {
      try self.managedContext.save()
      self.getCalcs()
    } catch {
      print(error)
    }
  }
  
  func getCalcs() {
    if let fetched = try? managedContext.fetch(CalcEntity.allCalcs()){
      self.calcs = []
      for calc in fetched {
        if calc.id != nil{
          self.calcs.append(calc)
        }
      }
    }
  }
  
}
