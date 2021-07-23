//
//  EmployeeTableViewCell.swift
//  Demo_SQLite
//
//  Created by MeoBeo on 10/10/20.
//  Copyright © 2020 Nguyen Anh Dao. All rights reserved.
//

import UIKit

class EmployeeTableViewCell: UITableViewCell {
    @IBOutlet var lbl2Name: UILabel!
    @IBOutlet var lbl2Date: UILabel!
    @IBOutlet var lbl2Identifier: UILabel!
    @IBOutlet var lbl2Manager: UILabel!
    @IBOutlet var lbl2Title: UILabel!
    @IBOutlet var lbl2Department: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
