//
//  ViewController.swift
//  BambooNews
//
//  Created by erick silva teran on 16/11/2020.
//

import UIKit


class ViewController: UIViewController {
  
  let newsManager = NewsManager()
  var articles: [Article]?

  override func viewDidLoad() {
    super.viewDidLoad()
//    topHeadlinesEndPoint()
    fetchHeadlines()
    

  }
//  func topHeadlinesEndPoint() {
//
//    let parametres = ["country":"us" , "apiKey":"ad744c6e7c234011ad5decae4f173e16"]
//
//    AF.request(EndPoints.topHeadlines.url , parameters: parametres).validate().responseDecodable(of: ArticleList.self) { (response) in
//      guard let articleList: ArticleList = response.value else { return }
//
//      for article in articleList.articles {
//
//        let articleDescription: String = "##el titulo es## \(article.title) ##con la descripción \(article.description)##Data##\(article.publishedAt)\n\n"
//
//        print(articleDescription)
//        print(articleList.totalResults)
//      }
//    }
//  }

  private func fetchHeadlines() {
  newsManager.fetchHeadlines(countryId: .estadosUnidos,
                             success: { (news) in
                              self.articles = news.articles
                              print(news.totalResults)
                              print(news.articles.last?.title)
    
  })
  }
}
