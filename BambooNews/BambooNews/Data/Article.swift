//
//  Article.swift
//  BambooNews
//
//  Created by erick silva teran on 16/11/2020.
//

import Foundation


struct Article: Decodable {
  let source: ArticleSource
  let author: String?
  let title: String
  let description: String?
  let url: String
  let urlToImage: String?
  let publishedAt: String
  let content: String?
  
}
