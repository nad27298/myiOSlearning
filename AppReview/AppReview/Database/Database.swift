//
//  Database.swift
//  AppReview
//
//  Created by MeoBeo on 10/11/20.
//  Copyright © 2020 Nguyen Anh Dao. All rights reserved.
//

import Foundation
import SQLite

class Database {
    static let shared = Database()
    
    public let connection: Connection?
    public let databaseFileName = "appreview.sqlite3"
    
    private init () {
        let dbPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first as String?
        do {
            print("DB path: " + dbPath!)
            connection = try Connection("\(dbPath!)/(databaseFileName)")
        }catch{
            connection = nil
            let nserror = error as NSError
            print("Cannot connect to Database. Error is: \(nserror), \(nserror.userInfo)")
        }
    }

}
