//
//  FullSource.swift
//  BambooNews
//
//  Created by erick silva teran on 20/11/2020.
//

import Foundation


struct FullSource: Decodable {
  let id: String
  let name: String
  let description: String
  let url: String
  let category: String
  let language: String
  let country: String
}
