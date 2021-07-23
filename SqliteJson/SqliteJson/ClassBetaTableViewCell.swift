//
//  ClassBetaTableViewCell.swift
//  SqliteJson
//
//  Created by MeoBeo on 10/10/20.
//  Copyright © 2020 Nguyen Anh Dao. All rights reserved.
//

import UIKit
import SQLite
final class ClassBetaTableViewCell: UITableViewCell {
    
    @IBOutlet var lblBetaTen: UILabel!
    @IBOutlet var lblBetaTuoi: UILabel!
    @IBOutlet var lblBetaDiaChi: UILabel!
    @IBOutlet var imgMonHoc: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func fillBeta (_ beta:Beta) {
        lblBetaTen.text = beta.ten
        lblBetaTuoi.text = String(beta.tuoi)
        lblBetaDiaChi.text = beta.diachi
        imgMonHoc.image = UIImage(named: beta.monhoc)
    }
    

}
