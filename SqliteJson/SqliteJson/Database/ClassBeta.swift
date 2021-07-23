//
//  ClassBeta.swift
//  SqliteJson
//
//  Created by MeoBeo on 10/10/20.
//  Copyright © 2020 Nguyen Anh Dao. All rights reserved.
//

import Foundation
import SQLite

class ClassBeta {
    static let shared = ClassBeta()
    
    private let tblClassBeta = Table("tblClassBeta")
    
    private let id = Expression<Int64>("id")
    private let ten = Expression<String>("ten")
    private let tuoi = Expression<Int64>("tuoi")
    private let diachi = Expression<String>("diachi")
    private let monhoc = Expression<String>("monhoc")
    
    private init() {
        // Tạo table nếu không tồn tại
        do {
            if let connection = Database.shared.connection {
                try connection.run(tblClassBeta.create(temporary: false, ifNotExists: true, withoutRowid: false, block: { (table) in
                    table.column(self.id, primaryKey: true)
                    table.column(self.ten)
                    table.column(self.tuoi)
                    table.column(self.diachi)
                    table.column(self.monhoc)
                }))
                print("Creat table tblClassBeta successfully")
            } else {
                print("Creat table tblClassBeta failed")
            }
        } catch {
            let nserror = error as NSError
            print("Creat tblClassBeta failed. Error is: \(nserror), \(nserror.userInfo)")
        }
    }
    
    // Chèn 1 bản record vào tblDepartment
    func insert(ten: String, tuoi: Int64?, diachi: String, monhoc: String) -> Int64? {
        do {
            let insert = tblClassBeta.insert(self.ten <- ten,
                                              self.tuoi <- tuoi ?? 0,
                                              self.diachi <- diachi,
                                              self.monhoc <- monhoc)
            let insertedId = try Database.shared.connection!.run(insert)
            return insertedId
        } catch {
            let nserror = error as NSError
            print("Cannot insert new tblClassAlpha. Error is: \(nserror), \(nserror.userInfo)")
            return nil
        }
    }
    
    // Truy vấn tất cả đên tblDepartment
    func queryAll() -> AnySequence<Row>? {
        do {
            return try Database.shared.connection?.prepare(self.tblClassBeta)
        } catch {
            let nserror = error as NSError
            print("Cannot querry(list) tblClassBeta. Error is: \(nserror), \(nserror.userInfo)")
            return nil
        }
    }
    
    func toString(classbeta: Row) {
        print("""
            Department details.
            id = \(classbeta[self.id]),
            ten = \(classbeta[self.ten]),
            tuoi = \(classbeta[self.tuoi]),
            diachi = \(classbeta[self.diachi]),
            monhoc = \(classbeta[self.monhoc]))
            """)
    }
    
    func toJSON(classbeta: Row) -> [String: Any] {
        let sqlResult = """
        {"id": \(classbeta[self.id]),
        "ten": "\(classbeta[self.ten])",
        "tuoi": \(classbeta[self.tuoi]),
        "diachi": "\(classbeta[self.diachi])",
        "monhoc": "\(classbeta[self.monhoc])"}
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
