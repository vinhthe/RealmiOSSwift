//
//  UserRealm.swift
//  RealmiOSDatabase
//
//  Created by Vinh The on 4/23/17.
//  Copyright © 2017 Vinh The. All rights reserved.
//

import Foundation

class UserRealm {
  
  class func createUserPrimaryKey() -> Int{
    
    return RealmManager.shared.realm.objects(User.self).count + 1
    
  }
  
  class func createUser(user: User) -> User?{
    
    if RealmManager.shared.saveObject(user) {
      return user
    }
    
    return nil
    
  }
  
  class func getAllUser() -> Results<User> {
    
    let users = RealmManager.shared.realm.objects(User.self)
    
    return users
    
  }
  
}
