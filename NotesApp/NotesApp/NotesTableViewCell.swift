//
//  NotesTableViewCell.swift
//  NotesApp
//
//  Created by MeoBeo on 10/17/20.
//  Copyright © 2020 Nguyen Anh Dao. All rights reserved.
//

import UIKit
import SQLite

class NotesTableViewCell: UITableViewCell {
    @IBOutlet var lblNotes: UILabel!
    @IBOutlet var lblTime: UILabel!
    @IBOutlet var btnCheck: UIButton!

    var dataA: AppNotes!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    @IBAction func btn_Check(_ sender: Any) {
        if dataA.check == true {
            self.btnCheck.setImage(UIImage(named: "uncheck"), for: .normal)
        } else {
            self.btnCheck.setImage(UIImage(named: "check"), for: .normal)
        }
        dataA.check = !dataA.check
        _ = Notes.shared.update(id: dataA.id, notes: dataA.notes, check: dataA.check, time: dataA.time)
    }
    
    func fillData (_ data: AppNotes) {
        dataA = data
        
        lblNotes.text = data.notes
        
        let date = Date(timeIntervalSince1970: TimeInterval(data.time))
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT +7") //Set timezone that you want
        dateFormatter.locale = NSLocale.current
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm" //Specify your format that you want
        let strDate = dateFormatter.string(from: date)
        
        lblTime.text = strDate

        if data.check == false {
            self.btnCheck.setImage(UIImage(named: "uncheck"), for: .normal)
        } else {
            self.btnCheck.setImage(UIImage(named: "check"), for: .normal)
        }
    }
    
    
    
}
