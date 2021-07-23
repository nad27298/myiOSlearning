//
//  ClassAlphaTableViewCell.swift
//  SqliteJson
//
//  Created by MeoBeo on 10/10/20.
//  Copyright © 2020 Nguyen Anh Dao. All rights reserved.
//

import UIKit
import SQLite

class ClassAlphaTableViewCell: UITableViewCell {
    @IBOutlet var lblAlphaTen: UILabel!
    @IBOutlet var lblAlphaTuoi: UILabel!
    @IBOutlet var lblAlphaDiaChi: UILabel!
    @IBOutlet var imgMonHoc: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func fillAlpha(_ alpha:Alpha) {
        lblAlphaTen.text = alpha.ten
        lblAlphaTuoi.text = String(alpha.tuoi)
        lblAlphaDiaChi.text = alpha.diachi
        imgMonHoc.image = UIImage(named: alpha.monhoc)
    }

}
