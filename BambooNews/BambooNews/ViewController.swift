//
//  ViewController.swift
//  BambooNews
//
//  Created by erick silva teran on 16/11/2020.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    topHeadlinesEndPoint()
    print(topHeadlinesEndPoint())

  }
  func topHeadlinesEndPoint() {
    
    let parameters = ["country": "us" , "apiKey" : "ad744c6e7c234011ad5decae4f173e16"]
    
  AF.request(EndPoints.topHeadlines.url, parameters: parameters).validate().responseDecodable(of: ArticleList.self) { (response) in
    
    guard let articleList: ArticleList = response.value else {
      print(String(describing: response.error))
      return
    }
    print(articleList.totalResults)
    
  
    for articulo in articleList.articles {
      
      let articleDescription: String = "## \(articulo.title) lives in \(articulo.description)\n\n"
      print(articleDescription)
      
//      self.append(articleDescription)
      
    }
  }
  }

}

