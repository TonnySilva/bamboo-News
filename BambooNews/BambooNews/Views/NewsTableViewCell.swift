//
//  NewsTableViewCell.swift
//  BambooNews
//
//  Created by erick silva teran on 17/11/2020.
//

import UIKit
import Alamofire
import AlamofireImage


class NewsTableViewCell: UITableViewCell {

  @IBOutlet weak var imageViewCell: UIImageView!
  
  @IBOutlet weak var labelCell: UILabel!
  
  
  
  
  
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
