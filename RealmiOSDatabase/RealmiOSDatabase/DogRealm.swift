//
//  DogRealm.swift
//  RealmiOSDatabase
//
//  Created by Vinh The on 4/24/17.
//  Copyright © 2017 Vinh The. All rights reserved.
//

import Foundation

class DogRealm {
  
  class func createDog(dog: Dog) -> Dog?{
  
    if RealmManager.shared.saveObject(dog){
      return dog
    }
    
    return nil
    
  }
  
}
