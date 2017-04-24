//
//  Dog.swift
//  RealmiOSDatabase
//
//  Created by Vinh The on 4/23/17.
//  Copyright © 2017 Vinh The. All rights reserved.
//

import Foundation
import RealmSwift

class Dog: Object {

  dynamic var name: String = ""
  
  let owners = LinkingObjects(fromType: User.self, property: "dogs")
  var owner: User{
    return owners.first!
  }
  
  convenience init(name: String) {
    self.init()
    self.name = name
    
  }
}
