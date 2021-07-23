//
//  TableViewCell.swift
//  78_Demo_TableView_2
//
//  Created by MeoBeo on 9/17/20.
//  Copyright © 2020 Nguyen Anh Dao. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet var imgView: UIImageView!
    
    @IBOutlet var lblTen: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
