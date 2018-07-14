//
//  FeedRelatedVideoCollectionViewCell.swift
//  TheVargo
//
//  Created by Andre on 13/07/2018.
//  Copyright © 2018 AndreSamples. All rights reserved.
//

import UIKit
import AlamofireImage

class FeedRelatedVideoCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var collectionImageView: UIImageView!
    @IBOutlet weak var collectionTitleLabel: UILabel!
    
    var feedListItemInteraction: FeedListItemInteraction?
    
    var item: FeedListItemInterface? {
        didSet {
            if let urlString = item?.imageURL, let url = URL(string: urlString) {
                collectionImageView.af_setImage(withURL: url, placeholderImage: #imageLiteral(resourceName: "ic_place_holder"))
            } else {
                collectionImageView.image = #imageLiteral(resourceName: "ic_place_holder")
            }
            collectionTitleLabel.text = item?.title
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
