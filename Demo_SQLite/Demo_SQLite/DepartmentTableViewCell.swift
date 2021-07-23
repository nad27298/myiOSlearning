//
//  DepartmentTableViewCell.swift
//  Demo_SQLite
//
//  Created by MeoBeo on 10/10/20.
//  Copyright © 2020 Nguyen Anh Dao. All rights reserved.
//

import UIKit

class DepartmentTableViewCell: UITableViewCell {
    @IBOutlet var lblName: UILabel!
    @IBOutlet var lblAdress: UILabel!
    @IBOutlet var lblCity: UILabel!
    @IBOutlet var lblZipCode: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }


}
