//
//  ViewController.swift
//  List JSON Example
//
//  Created by Jonas Bylund on 2020-06-07.
//  Copyright © 2020 Jonas Bylund. All rights reserved.
//

import UIKit

class ListExampleViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }
}

extension ListExampleViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    0
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    UITableViewCell(style: .default, reuseIdentifier: " ListExampleCell")
  }
}

extension ListExampleViewController: ListExampleViewDelegate {
  func refreshButtonPressed() {
  }
}

extension ListExampleViewController: ListExampleViewModelDelegate {
  func postsUpdated() {
    
  }
}
