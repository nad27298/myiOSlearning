//
//  Class.swift
//  SqliteJson
//
//  Created by MeoBeo on 10/10/20.
//  Copyright © 2020 Nguyen Anh Dao. All rights reserved.
//

import Foundation
import SQLite

final class Alpha {
    
    var ten = String()
    var tuoi = Int()
    var diachi = String()
    var monhoc = String()
    
    init(alpha: [String: Any]) {
        if let ten = alpha["ten"] as? String {
            self.ten = ten
        }
        if let tuoi = alpha["tuoi"] as? Int {
            self.tuoi = tuoi
        }
        if let diachi = alpha["diachi"] as? String {
            self.diachi = diachi
        }
        if let monhoc = alpha["monhoc"] as? String {
            self.monhoc = monhoc
        }
    }
}

final class Beta {
    
    var ten = String()
    var tuoi = Int()
    var diachi = String()
    var monhoc = String()
    
    init(beta: [String: Any]) {
        if let ten = beta["ten"] as? String {
            self.ten = ten
        }
        if let tuoi = beta["tuoi"] as? Int {
            self.tuoi = tuoi
        }
        if let diachi = beta["diachi"] as? String {
            self.diachi = diachi
        }
        if let monhoc = beta["monhoc"] as? String {
            self.monhoc = monhoc
        }
    }
    
}

