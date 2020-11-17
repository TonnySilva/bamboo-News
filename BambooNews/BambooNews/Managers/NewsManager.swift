//
//  NewsManager.swift
//  BambooNews
//
//  Created by erick silva teran on 17/11/2020.
//

import Foundation
import Alamofire

struct NewsManager {
//  creo una constante apikeyvalue con los datos de la url xq asi no lo pongo a cada rato cada vez k me la pida y al cambiar de url es mas fácil.
  let apiKeyValue: String = "ad744c6e7c234011ad5decae4f173e16"
//
  
  func fetchHeadlines(countryId: CountryType,
                      success: @escaping (ArticleList) -> ()){
    
      
//    let parametres = ["country":"us" , "apiKey":"ad744c6e7c234011ad5decae4f173e16"]
    let parametres: [String: String] = [
      EndPointsParameters.country.rawValue: countryId.rawValue  ,
      EndPointsParameters.apiKey.rawValue: apiKeyValue ]
    
    
        AF.request(EndPoints.topHeadlines.url , parameters: parametres).validate().responseDecodable(of: ArticleList.self) { (response) in
          guard let articleList: ArticleList = response.value else { return }
    
          for article in articleList.articles {
    
            let articleDescription: String = "##el titulo es## \(article.title) ##con la descripción \(article.description)##Data##\(article.publishedAt)\n\n"
    
            print(articleDescription)
            print(articleList.totalResults)
            
            success(articleList)
          }
        }
      }
}
