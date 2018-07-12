//
//  FeedArticleTableViewCell.swift
//  TheVargo
//
//  Created by Andre Souza on 12/07/2018.
//  Copyright © 2018 AndreSamples. All rights reserved.
//

import UIKit
import AlamofireImage

class FeedArticleTableViewCell: UITableViewCell {
    
    @IBOutlet weak var cellImageView: UIImageView!
    @IBOutlet weak var cellBookMarkButton: UIButton!
    @IBOutlet weak var cellTitleLabel: UILabel!
    @IBOutlet weak var cellDescriptionLabel: UILabel!
    
    
    var item: FeedItemInterface? {
        didSet {
            if let urlString = item?.imageURL, let url = URL(string: urlString) {
                cellImageView.af_setImage(withURL: url, placeholderImage: #imageLiteral(resourceName: "ic_place_holder"))
            } else {
                cellImageView.image = #imageLiteral(resourceName: "ic_place_holder")
            }

            cellTitleLabel.text = item?.title
            cellDescriptionLabel.text = item?.description
            cellBookMarkButton.isSelected = item?.isMarked ?? false
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
