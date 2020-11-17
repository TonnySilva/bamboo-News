//
//  EndPoints.swift
//  BambooNews
//
//  Created by erick silva teran on 16/11/2020.
//

import Foundation
import Alamofire

enum EndPoints: String {
  case topHeadlines = "https://newsapi.org/v2/top-headlines"
  case everything = "https://newsapi.org/v2/everything"
  case sources = "https://newsapi.org/v2/sources"
  
  var url: String {
    return self.rawValue }
}
