//
//  ArticleList.swift
//  BambooNews
//
//  Created by erick silva teran on 16/11/2020.
//

import Foundation

struct ArticleList: Decodable {
  let status: String
  let totalResults: Int
  let articles: [Article]
}
