//
//  User.swift
//  RealmiOSDatabase
//
//  Created by Vinh The on 4/23/17.
//  Copyright © 2017 Vinh The. All rights reserved.
//

import Foundation
import RealmSwift

class User: Object {
  
  // Specify properties to ignore (Realm won't persist these)
  
  //  override static func ignoredProperties() -> [String] {
  //    return []
  //  }
  
  dynamic var key: Int = 0
  dynamic var name: String = ""
  dynamic var age: Int = 0
  dynamic var address: String = ""
  dynamic var password: String = ""
  var dogs = List<Dog>()
  
  convenience init(primaryKey: Int, name: String, age: Int, address: String, password: String) {
    self.init()
    self.key = primaryKey
    self.name = name
    self.age = age
    self.address = address
    self.password = password
  }
  
  override static func primaryKey() -> String? {
    return "key"
  }
  
}
