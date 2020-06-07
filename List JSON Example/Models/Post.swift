//
//  Post.swift
//  List JSON Example
//
//  Created by Jonas Bylund on 2020-06-07.
//  Copyright © 2020 Jonas Bylund. All rights reserved.
//

import Foundation

struct Post: Codable {
  let userId: Int
  let id: Int
  let title: String
  let body: String
}
