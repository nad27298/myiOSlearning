//
//  FoodTableViewCell.swift
//  TableViewExample
//
//  Created by Nguyen Duc Hoang on 9/6/17.
//  Copyright © 2017 Nguyen Duc Hoang. All rights reserved.
//

import UIKit

class FoodTableViewCell: UITableViewCell {
    @IBOutlet weak var imageViewFood: UIImageView?
    @IBOutlet weak var lblFoodName: UILabel?
    @IBOutlet weak var lblDescription: UILabel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
