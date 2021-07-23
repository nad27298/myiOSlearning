//
//  AppReviewTableViewCell.swift
//  AppReview
//
//  Created by MeoBeo on 10/11/20.
//  Copyright © 2020 Nguyen Anh Dao. All rights reserved.
//

import UIKit
import SQLite

class AppReviewTableViewCell: UITableViewCell {
    
    @IBOutlet var imgImage: UIImageView!
    @IBOutlet var lblTrackName: UILabel!
    @IBOutlet var lblRating: UILabel!
    @IBOutlet var lblTrackId: UILabel!
    @IBOutlet var lblDescription: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
//    func fillData(_ data:AppReview) {
//        imgImage.image = UIImage(named: data.image)
//        lblTrackName.text = data.trackName
//        lblRating.text = data.rating
//        lblTrackId.text = String(data.trackId)
//        lblDescription.text = data.description
//    }


}
