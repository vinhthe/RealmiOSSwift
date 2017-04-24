//
//  RealmManager.swift
//  RealmiOSDatabase
//
//  Created by Vinh The on 4/23/17.
//  Copyright © 2017 Vinh The. All rights reserved.
//

import Foundation

typealias CompletionRealm = (Bool,Object?) -> ()


class RealmManager {
  
  static let shared = RealmManager()
  
  private init(){}
  
  let realm = try! Realm()
  
  var realmURL: String{
    return Realm.Configuration.defaultConfiguration.fileURL!.absoluteString
  }
  
  func saveObject(_ object: Object) -> Bool {
    do {
      try realm.write {
        realm.add(object)
      }
      return true
    } catch let error {
      print("Error:\(error.localizedDescription)")
      return false
    }
  }
  

  
}
