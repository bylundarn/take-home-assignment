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
    viewModel.configure(view: listExampleView)
    viewModel.refreshPosts()
  }
}

extension ListExampleViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return viewModel.postCount
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "ListExampleCell")
    let row = indexPath.row
    cell.textLabel?.numberOfLines = 0
    cell.textLabel?.text = viewModel.title(for: row)
    cell.detailTextLabel?.numberOfLines = 0
    cell.detailTextLabel?.text = viewModel.body(for: row)
    return cell
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
