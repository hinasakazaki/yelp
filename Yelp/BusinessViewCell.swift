//
//  BusinessViewCell.swift
//  Yelp
//
//  Created by Hina Sakazaki on 9/25/15.
//  Copyright © 2015 Timothy Lee. All rights reserved.
//

import UIKit

class BusinessViewCell: UITableViewCell {

    @IBOutlet weak var businessName: UILabel!
    @IBOutlet weak var thumbnailView: UIImageView!
    @IBOutlet weak var reviewCount: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var ratingImageView: UIImageView!
    
    var business : Business! {
        didSet{
            businessName.text = business.name
            thumbnailView.setImageWithURL(business.imageURL)
            ratingImageView.setImageWithURL(business.ratingImageURL)
            categoryLabel.text = business.categories
            addressLabel.text = business.address
            reviewCount.text = "\(business.reviewCount!) reviews"
            distanceLabel.text = business.distance
           
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        thumbnailView.layer.cornerRadius = 3
        thumbnailView.clipsToBounds = true
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
