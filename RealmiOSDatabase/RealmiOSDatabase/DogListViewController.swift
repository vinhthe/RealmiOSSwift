//
//  DogListViewController.swift
//  RealmiOSDatabase
//
//  Created by Vinh The on 4/23/17.
//  Copyright © 2017 Vinh The. All rights reserved.
//

import UIKit

class DogListViewController: UIViewController {
  
  var user: User!
  
  @IBOutlet weak var dogTableView: UITableView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view.
    
    title = user.name
    
    print(user.dogs.count)
    
    dogTableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    
  }
  
  @IBAction func logout(_ sender: UIBarButtonItem) {
    dismiss(animated: true, completion: nil)
  }
  
  @IBAction func addDog(_ sender: UIBarButtonItem){
    let dog = Dog(name: "Sam")
    
    try! RealmManager.shared.realm.write {
      user.dogs.append(dog)
      self.dogTableView.reloadData()
    }
    
  }
  
}

extension DogListViewController: UITableViewDataSource{

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
    
    let dog = user.dogs[indexPath.row]
    
    cell.textLabel?.text = "\(dog.name) - \(dog.owner.name)"
    
    return cell
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return user.dogs.count
  }
  
}

extension DogListViewController: UITableViewDelegate{

}
