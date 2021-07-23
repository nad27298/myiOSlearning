//
//  Notes.swift
//  NotesApp
//
//  Created by MeoBeo on 10/17/20.
//  Copyright © 2020 Nguyen Anh Dao. All rights reserved.
//

import Foundation
import SQLite

class Notes {
    
    static let shared = Notes()
    
    private let tblNotes = Table("tblNotes")
    
    private let id = Expression<Int64>("id")
    private let notes = Expression<String>("notes")
    private let check = Expression<Bool>("check")
    private let time = Expression<Int64>("time")

    private init() {
        do {
            if let connection = Database.shared.connection {
                try connection.run(tblNotes.create(temporary: false, ifNotExists: true, withoutRowid: false, block: { (table) in
                    table.column(self.id, primaryKey: true)
                    table.column(self.notes)
                    table.column(self.check)
                    table.column(self.time)
                }))
                print("Creat table tblNotes successfully")
            } else {
                print("Creat table tblNotes failed")
            }
        } catch {
            let nserror = error as NSError
            print("Creat table tblNotes failed. Error is: \(nserror), \(nserror.userInfo)")
        }
    }
    
    func insert(notes: String, check: Bool, time: Int64) -> Int64? {
        do {
            let insert = tblNotes.insert(self.notes <- notes,
                                         self.check <- check,
                                         self.time <- time)
            let insertedId = try Database.shared.connection!.run(insert)
            return insertedId
        } catch {
            let nserror = error as NSError
            print("Cannot insert new tblNotes. Error is: \(nserror), \(nserror.userInfo)")
            return nil
        }
    }
    
    func update(id: Int64, notes: String?, check: Bool?, time: Int64?) -> Bool {
        if Database.shared.connection == nil {
            return false
        }
        do {
            let tblFilterNotes = self.tblNotes.filter(self.id == id)
            var setter:[SQLite.Setter] = [SQLite.Setter]()
            if notes != nil {
                setter.append(self.notes <- notes!)
            }
            if check != nil {
                setter.append(self.check <- check!)
            }
            if time != nil {
                setter.append(self.time <- time!)
            }
            if setter.count == 0 {
                print("Nothing to update")
                return false
            }
            let update = tblFilterNotes.update(setter)
            if try Database.shared.connection!.run(update) <= 0 {
                return false
            }
            return true
        } catch {
            let nserror = error as NSError
            print("Cannot update object new tblNotes. Error is: \(nserror), \(nserror.userInfo)")
            return false
        }
    }
    
    func delete(id: Int64) -> Bool {
        if Database.shared.connection == nil {
            return false
        }
        do {
            let tblFilterNotes = self.tblNotes.filter(self.id == id)
            let delete = tblFilterNotes.delete()
            if try Database.shared.connection!.run(delete) <= 0 {
                return false
            }
            return true
        } catch {
            let nserror = error as NSError
            print("Cannot delete object new tblNotes. Error is: \(nserror), \(nserror.userInfo)")
            return false
        }
    }
    
    func queryAll() -> AnySequence<Row>? {
        do {
            return try Database.shared.connection?.prepare(self.tblNotes)
        } catch {
            let nserror = error as NSError
            print("Cannot querry(list) tblNotes. Error is: \(nserror), \(nserror.userInfo)")
            return nil
        }
    }
    
    func toJSON(appreview: Row) -> [String: Any] {
        let sqlResult = """
        {"id": \(appreview[self.id]),
        "notes": "\(appreview[self.notes])",
        "check": \(appreview[self.check]),
        "time": \(appreview[self.time])}
        """
        let jsonData = sqlResult.data(using: .utf8)
        if let json = try? JSONSerialization.jsonObject(with: jsonData!, options: []),
            let dict = json as? [String: Any]
        {
            return dict
        }
        return ["error":"-1" as Any]
    }
    
    
}
