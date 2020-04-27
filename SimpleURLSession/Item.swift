//
//  Item.swift
//  SimpleURLSession
//
//  Created by Hoang Tung on 4/26/20.
//  Copyright © 2020 Hoang Tung. All rights reserved.
//

import Foundation

struct Item: Codable {
  let title: String
  var tags: [String]
  var answer_count: Int
  var score: Int
  var link: String
}

struct Items: Codable {
  var items: [Item]
}
