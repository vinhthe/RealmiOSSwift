//
//  ViewController.swift
//  RealmiOSDatabase
//
//  Created by Vinh The on 4/23/17.
//  Copyright © 2017 Vinh The. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
  
  
  @IBOutlet weak var usernameTextField: UITextField!
  
  @IBOutlet weak var passwordTextField: UITextField!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    print(RealmManager.shared.realmURL)
    
  }
  
  @IBAction func login(_ sender: UIButton) {
    guard usernameTextField.text != "", passwordTextField.text != "" else {
      print("Input please")
      return
    }
    
    let users = UserRealm.getAllUser()
    
    for user in users {
      
      if user.name == usernameTextField.text! && user.password == passwordTextField.text {
        let dogListNav = storyboard?.instantiateViewController(withIdentifier: "DogListNavigationController") as! UINavigationController
        
        let dogListVC = dogListNav.viewControllers.first as! DogListViewController
        
        dogListVC.user = user
        
        present(dogListNav, animated: true, completion: nil)
        
        break
      }
      
    }
    
  }
  
  @IBAction func register(_ sender: UIButton) {
    
    let registerVC = storyboard?.instantiateViewController(withIdentifier: "RegisterViewController") as! RegisterViewController
    
    present(registerVC, animated: true, completion: nil)
    
  }
  
}

