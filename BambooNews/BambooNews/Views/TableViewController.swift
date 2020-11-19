//
//  TableViewController.swift
//  BambooNews
//
//  Created by erick silva teran on 17/11/2020.
//

import UIKit
import AlamofireImage

class TableViewController: UITableViewController {
  
  @IBAction func searchText(_ sender: Any) {
    
  }
  
  
  let newsManager = NewsManager()
  var articles: [Article]?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    
    //fetchHeadlines()
    //    fetchEveryting()
  }
  
  private func fetchHeadlines() {
    newsManager.fetchHeadlines(countryId: .estadosUnidos,
                               success: { (news) in
                                self.articles = news.articles
                                self.tableView.reloadData()
                                
                               })
  }
  private func fetchEveryting(query: String) {
    newsManager.fetchEverything(query: query ?? "" , succes: { (news) in
      self.articles = news.articles
      self.tableView.reloadData()
    })
  }
  
  
  // MARK: - Table view data source
  
  override func numberOfSections(in tableView: UITableView) -> Int {
    // #warning Incomplete implementation, return the number of sections
    return 1
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    return articles?.count ?? 0
  }
  
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier" , for: indexPath)
    if let newsCell = cell as? NewsTableViewCell,
       let article: Article = articles?[indexPath.row] {
      newsCell.labelCell.text = article.title
      
      
      if let urlToImage = article.urlToImage,
         let url = URL(string: urlToImage) {
        newsCell.imageViewCell.af.setImage(withURL: url )
        
      }
    }
    
    return cell
  }
  //  pasar infomacion a la segunda pantalla cuando se selecciona una cell.
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    NewsViewModel.selectedArticle = articles?[indexPath.row]
    
    performSegue(withIdentifier: "goToDetail", sender: nil)
    
  }
  
  /*
   // Override to support conditional editing of the table view.
   override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
   // Return false if you do not want the specified item to be editable.
   return true
   }
   */
  
  /*
   // Override to support editing the table view.
   override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
   if editingStyle == .delete {
   // Delete the row from the data source
   tableView.deleteRows(at: [indexPath], with: .fade)
   } else if editingStyle == .insert {
   // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
   }
   }
   */
  
  /*
   // Override to support rearranging the table view.
   override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
   
   }
   */
  
  /*
   // Override to support conditional rearranging of the table view.
   override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
   // Return false if you do not want the item to be re-orderable.
   return true
   }
   */
  
  
  // MARK: - Navigation
  
  // In a storyboard-based application, you will often want to do a little preparation before navigation
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
  }
  
  
}
extension TableViewController: UITextFieldDelegate {
  
  func textFieldShouldReturn(_ textField: UITextField) -> Bool{
    print("searchButton \(textField.text)")
    
    //    newsManager.fetchEverything(query: "searchButton", succes: { (news) in
    //      self.articles = news.articles
    //      self.tableView.reloadData()
    
    fetchEveryting(query: "searchText")
    return true
  }
  
}


