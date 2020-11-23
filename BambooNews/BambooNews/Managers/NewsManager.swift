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
  let apiKeyValue: String = "14bbae1e46314adf97213d63d1876983"
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
  
  //  llamando al endpoint everything
  
  func fetchEverything(query: String,
                       succes: @escaping (ArticleList) -> ()) {
    
    let parametres: [String: String] = [
      EndPointsParameters.query.rawValue: query ,
      EndPointsParameters.apiKey.rawValue: apiKeyValue ]
    
    AF.request(EndPoints.everything.url , parameters: parametres).validate().responseDecodable(of: ArticleList.self) { (response) in
      guard let newsEverything: ArticleList = response.value else { return }
      
      for articleEverything in newsEverything.articles {
        
        let articleEverything: String = "##el titulo Everything## \(newsEverything.status) ##con la descripción everything \(newsEverything.articles)\n\n"
        
        print("everythingPrint \(articleEverything)")
        
      }
      succes(newsEverything)
    }
  }
  
  func fetchSource( succes: @escaping (SourcesList) -> ()) {
    
    let parametres: [String: String] = [
      EndPointsParameters.apiKey.rawValue: apiKeyValue
    ]
    
    AF.request(EndPoints.sources.url , parameters: parametres).validate().responseDecodable(of: SourcesList.self) { (response) in
      guard let sourcesList: SourcesList = response.value else {
        return
      }
      print("···newsSources···: \(sourcesList)")
      succes(sourcesList)
    }
  }
  
  func fetchMovie( succes: @escaping (Movies)-> ()) {
    AF.request(EndPoints.movies.url).validate().responseDecodable(of: Movies.self) { (films) in
      guard let movieList: Movies = films.value else {
        print("@@error@@")
        return
      }
      print("@@filmsMovie: \(movieList)")
      succes(movieList)
    }
    }
    
  }
