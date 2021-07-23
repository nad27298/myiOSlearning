//
//  File.swift
//  NotesApp
//
//  Created by MeoBeo on 10/17/20.
//  Copyright © 2020 Nguyen Anh Dao. All rights reserved.
//

import Foundation
import SQLite

final class AppNotes {
    
    var id = Int64()
    var notes = String()
    var check = Bool()
    var time = Int64()
 
    init(data: [String: Any]) {
        if let id = data["id"] as? Int64 {
            self.id = id
        }
        if let notes = data["notes"] as? String {
            self.notes = notes
        }
        if let check = data["check"] as? Bool {
            self.check = check
        }
        if let time = data["time"] as? Int64 {
            self.time = time
        }

    }
    
    
}


