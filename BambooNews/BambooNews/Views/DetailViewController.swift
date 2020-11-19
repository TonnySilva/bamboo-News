//
//  DetailViewController.swift
//  BambooNews
//
//  Created by erick silva teran on 18/11/2020.
//

import UIKit

class DetailViewController: UIViewController {
  
  @IBOutlet weak var titleOutlet: UILabel!
  
  @IBOutlet weak var labelInformation: UILabel!
  
  @IBOutlet weak var labelData: UILabel!
  
  @IBOutlet weak var imageViewDetail: UIImageView!
  
  @IBOutlet weak var textNews: UITextView!
  
  @IBAction func buttonWebAction(_ sender: Any) {
    
    
    
  
    guard let article: Article = NewsViewModel.selectedArticle ,
          let webUrl = URL(string: article.url) else { return }
    
    UIApplication.shared.open(webUrl)
    
  }
  
  

    override func viewDidLoad() {
        super.viewDidLoad()
      configureView()
      
      guard let article: Article = NewsViewModel.selectedArticle else { return }
      
      
    }
  
 private func configureView() {
  guard let article: Article = NewsViewModel.selectedArticle else { return }
  self.title = article.source.name
  titleOutlet.text = article.title
  labelInformation.text = article.author ?? ""
  labelData.text = article.publishedAtFormatted
  textNews.text = article.description
  
  if let urlToImage = article.urlToImage,
     let url = URL(string: urlToImage ) {
    imageViewDetail.af.setImage(withURL: url)
  }
    
  }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
