//
//  BusinessDetailViewController.swift
//  Yelp
//
//  Created by Hina Sakazaki on 9/27/15.
//  Copyright © 2015 Hina Sakazaki. All rights reserved.
//

import UIKit

class BusinessDetailViewController: UIViewController {

    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var businessName: UILabel!
    
    @IBOutlet weak var numReviewLabel: UILabel!
    
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var starImageView: UIImageView!
    
    
    @IBOutlet weak var businessImage: UIImageView!
    @IBOutlet weak var addressLabel: UILabel!
    var business : Business! {
        didSet{
            print(business)
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.businessName.text = business.name
        self.businessName.text = business.name
        self.businessImage.setImageWithURL(business.imageURL)
        self.starImageView.setImageWithURL(business.ratingImageURL)
        self.categoryLabel.text = business.categories
        self.addressLabel.text = business.address
        self.numReviewLabel.text = "\(business.reviewCount!) reviews"
        self.distanceLabel.text = business.distance
      
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
