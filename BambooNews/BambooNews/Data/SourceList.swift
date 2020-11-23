//
//  SourcesList.swift
//  BambooNews
//
//  Created by erick silva teran on 20/11/2020.
//

import Foundation


struct SourcesList: Decodable {
  let status: String
  let sources: [FullSource]
}
