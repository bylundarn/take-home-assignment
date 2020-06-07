//
//  ListExampleModel.swift
//  List JSON Example
//
//  Created by Jonas Bylund on 2020-06-07.
//  Copyright © 2020 Jonas Bylund. All rights reserved.
//

import Foundation

class ListExampleModel {
  let postsURL = URL(string: "https://jsonplaceholder.typicode.com/posts")!
  var posts: [Post] = []
  
  func fetchPosts(completion: @escaping ((Result<Void, Error>) -> Void)) {
    URLSession.shared.dataTask(with: postsURL) { [weak self] data, _, error in
      guard let self = self else {
        return
      }
      guard error == nil else {
        completion(.failure(error!))
        return
      }
      guard let data = data else {
        completion(.success(()))
        return
      }
      do {
        let result = try JSONDecoder().decode([Post].self, from: data)
        completion(.success(()))
        self.posts = result
        return
      } catch {
        completion(.failure(error))
        return
      }
    }.resume()
  }

}
