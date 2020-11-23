//
//  MovieList.swift
//  BambooNews
//
//  Created by erick silva teran on 23/11/2020.
//

import Foundation


struct Movie: Decodable {
  let title: String
  let releaseYear : String
  
  enum CodingKeys: String, CodingKey {
    case releaseYear = "release_year"
    case title
  }
}
