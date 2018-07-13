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
    
    @IBOutlet weak var cellImageViewPlayer: UIImageView!
    @IBOutlet weak var cellImageView: UIImageView!
    @IBOutlet weak var cellBookMarkButton: UIButton!
    @IBOutlet weak var cellTitleLabel: UILabel!
    @IBOutlet weak var cellDescriptionLabel: UILabel!
    
    var feedListItemInteraction: FeedListItemInteraction?
    
    var item: FeedListItemInterface? {
        didSet {
            if let urlString = item?.imageURL, let url = URL(string: urlString) {
                cellImageView.af_setImage(withURL: url, placeholderImage: #imageLiteral(resourceName: "ic_place_holder"))
            } else {
                cellImageView.image = #imageLiteral(resourceName: "ic_place_holder")
            }
            
            cellImageViewPlayer.isHidden = !(item?.isVideo ?? false)
            cellTitleLabel.text = item?.title
            cellDescriptionLabel.text = item?.description
            cellBookMarkButton.isSelected = item?.isMarked ?? false
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func touchBookMark(_ sender: Any) {
        cellBookMarkButton.isSelected = !cellBookMarkButton.isSelected
        feedListItemInteraction?.didPressBookMark(self)
    }
    
    func setupLayout() {
        contentView.layer.masksToBounds = true
        contentView.backgroundColor = .clear
        backgroundColor = .white
        layer.masksToBounds = false
        layer.shadowColor = UIColor.groupTableViewBackground.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 1)
        layer.shadowRadius = 6
        layer.shadowOpacity = 0.5
        layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: contentView.layer.cornerRadius).cgPath
    }
    
}
