//
//  ViewController.swift
//  List JSON Example
//
//  Created by Jonas Bylund on 2020-06-07.
//  Copyright © 2020 Jonas Bylund. All rights reserved.
//

import UIKit

class ListExampleViewController: UIViewController {
  var viewModel = ListExampleViewModel()
  
  var listExampleView: ListExampleView {
    return view as! ListExampleView
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    viewModel.delegate = self
    listExampleView.delegate = self
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
    listExampleView.dataUpdated()
  }
}
