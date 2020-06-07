//
//  ListExampleViewModel.swift
//  List JSON Example
//
//  Created by Jonas Bylund on 2020-06-07.
//  Copyright © 2020 Jonas Bylund. All rights reserved.
//

import Foundation

class ListExampleViewModel {
  let listExampleModel = ListExampleModel()
  weak var delegate: ListExampleViewModelDelegate?
  
  var validPosts: [Post] {
    return listExampleModel.posts.filter { $0.id < 50 }
  }
  
  var postCount: Int {
    return validPosts.count
  }
  
  func title(for index: Int) -> String {
    guard validPosts.count > index else {
      return "N/A"
    }
    return "\(validPosts[index].id): \(validPosts[index].title)"
  }
  
  func body(for index: Int) -> String {
    return validPosts[index].body
  }
  
  func configure(view: ListExampleView) {
    view.refreshButton.setTitle("Refresh", for: .normal)
  }
  
  func refreshPosts() {
    listExampleModel.fetchPosts() { [weak self] result in
      guard let self = self else { return }
      switch result {
      case let .failure(error):
        print(error.localizedDescription)
      case .success:
        DispatchQueue.main.async {
          self.delegate?.postsUpdated()
        }
      }
    }
  }
}
