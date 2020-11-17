//
//  NewsManager.swift
//  BambooNews
//
//  Created by erick silva teran on 17/11/2020.
//

import Foundation
import Alamofire

struct NewsManager {
  
  
  func fetchHeadlines(){
      
    let parametres = ["country":"us" , "apiKey":"ad744c6e7c234011ad5decae4f173e16"]
    
        AF.request(EndPoints.topHeadlines.url , parameters: parametres).validate().responseDecodable(of: ArticleList.self) { (response) in
          guard let articleList: ArticleList = response.value else { return }
    
          for article in articleList.articles {
    
            let articleDescription: String = "##el titulo es## \(article.title) ##con la descripción \(article.description)##Data##\(article.publishedAt)\n\n"
    
            print(articleDescription)
            print(articleList.totalResults)
          }
        }
      }
}
