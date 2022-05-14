//
//  NewsTableViewCell.swift
//  iosAssignment
//
//  Created by Vivek Patel on 14/05/22.
//

import UIKit
import Kingfisher

class NewsTableViewCell: UITableViewCell {
//    var imageUrl: String = ""
    //MARK: - Outlets
    @IBOutlet weak var author: UILabel!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var newsDescription: UILabel!
    @IBOutlet weak var news: UILabel!
    @IBOutlet weak var imgeView: UIImageView!

    //MARK: - Life cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
//    func setImage() {
//        let url = URL(string: imageUrl)
//        imgeView.kf.setImage(with: url)
//    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
