//
//  RegisterViewController.swift
//  RealmiOSDatabase
//
//  Created by Vinh The on 4/23/17.
//  Copyright © 2017 Vinh The. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {
  
  
  @IBOutlet weak var usernameTextField: UITextField!
  @IBOutlet weak var passwordTextField: UITextField!
  @IBOutlet weak var ageTextField: UITextField!
  @IBOutlet weak var addressTextField: UITextField!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view.
  }
  
  @IBAction func close(_ sender: UIButton) {
    dismiss(animated: true, completion: nil)
  }
  
  @IBAction func register(_ sender: UIButton) {
    
    guard usernameTextField.text != "", passwordTextField.text != "", ageTextField.text != "", addressTextField.text != ""  else {
      print("Need input all field")
      return
    }
    
    guard let age = Int(ageTextField.text!) else {
      print("wrong age input")
      return
    }
    
    let user = User(primaryKey: UserRealm.createUserPrimaryKey(), name: usernameTextField.text!, age: age, address: addressTextField.text!, password: passwordTextField.text!)
    
    if let user = UserRealm.createUser(user: user){
      
      let dogListNav = storyboard?.instantiateViewController(withIdentifier: "DogListNavigationController") as! UINavigationController
      
      let dogListVC = dogListNav.viewControllers.first as! DogListViewController
      
      dogListVC.user = user
      
      present(dogListNav, animated: true, completion: nil)
    }
    
    
  }
  
}
