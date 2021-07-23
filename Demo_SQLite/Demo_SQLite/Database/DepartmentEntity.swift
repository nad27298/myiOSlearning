//
//  DepartmentEntity.swift
//  Demo_SQLite
//
//  Created by MeoBeo on 10/7/20.
//  Copyright © 2020 Nguyen Anh Dao. All rights reserved.
//

import Foundation
import SQLite

class DepartmentEntity {
    static let shared = DepartmentEntity()
    
    private let tblDepartment = Table("tblDepartment")
    
    private let id = Expression<Int64>("id")
    private let name = Expression<String>("name")
    private let address = Expression<String>("address")
    private let city = Expression<String>("city")
    private let zipCode = Expression<Int64>("zipCode")
    
    private init() {
        // Tạo table nếu không tồn tại
        do {
            if let connection = Database.shared.connection {
                try connection.run(tblDepartment.create(temporary: false, ifNotExists: true, withoutRowid: false, block: { (table) in
                    table.column(self.id, primaryKey: true)
                    table.column(self.name)
                    table.column(self.address)
                    table.column(self.city)
                    table.column(self.zipCode)
                }))
                print("Creat table tblDepartment successfully")
            } else {
                print("Creat table tblDepartment failed")
            }
        } catch {
            let nserror = error as NSError
            print("Creat table tblDepartment failed. Error is: \(nserror), \(nserror.userInfo)")
        }
    }
    // Chèn 1 bản record vào tblDepartment
    func insert(name: String, address: String, city: String, zipCode: Int64?) -> Int64? {
        do {
            let insert = tblDepartment.insert(self.name <- name,
                                              self.address <- address,
                                              self.city <- city,
                                              self.zipCode <- zipCode ?? 0)
            let insertedId = try Database.shared.connection!.run(insert)
            return insertedId
        } catch {
            let nserror = error as NSError
            print("Cannot insert new tblDepartment. Error is: \(nserror), \(nserror.userInfo)")
            return nil
        }
    }
    
    func filterDepartment() -> AnySequence<Row>? {
        do {
            //SELECT * FROM "tblDepartment" WHERE ("id" = 1)
            //let filterCondition = (id == 1)
            
            //SELECT * FROM "tblDepartment" WHERE ("id" IN (1, 2, 3, 4))
            //let filterCondition = [1, 2, 3, 4].contains(id)
            
            //SELECT * FROM "tblDepartment" WHERE ("name" LIKE '%Department')
            //let filterCondition = self.name.like("%Department")
            
            //SELECT * FROM "tblDepartment" WHERE name.lowercaseString == "sales department" AND id >= 3
            //let filterCondition = (id >= 3) && (name.lowercaseString == "sales department")
            
            //SELECT * FROM "tblDepartment" WHERE ("id" == 3) OR ("id" == 3)
            let filterCondition = (id == 3) || (id == 4)
            return try Database.shared.connection?.prepare(self.tblDepartment.filter(filterCondition))
        } catch {
            let nserror = error as NSError
            print("Cannot list / query object in tblDepartment. Error is: \(nserror), \(nserror.userInfo)")
            return nil
        }
    }
    // Truy vấn tất cả đên tblDepartment
    func queryAll() -> AnySequence<Row>? {
        do {
            return try Database.shared.connection?.prepare(self.tblDepartment)
        } catch {
            let nserror = error as NSError
            print("Cannot querry(list) tblDepartment. Error is: \(nserror), \(nserror.userInfo)")
            return nil
        }
    }
    
    func toString(department: Row) {
        print("""
            Department details.
            id = \(department[self.id]),
            name = \(department[self.name]),
            address = \(department[self.address]),
            city = \(department[self.city]),
            zipCode = \(department[self.zipCode]))
            """)
    }
    
    func getName(department: Row) -> String {
        return department[self.name]
    }
    
    func toJSON(department: Row) -> [String: AnyObject] {
        let sqlResult = """
        {"id": \(department[self.id]),
        "name": "\(department[self.name])",
        "address": "\(department[self.address])",
        "city": "\(department[self.city])",
        "zipCode": \(department[self.zipCode])}
        """
        let jsonData = sqlResult.data(using: .utf8)
        if let json = try? JSONSerialization.jsonObject(with: jsonData!, options: []),
            let dict = json as? [String: AnyObject]
        {
            return dict
        }
        return ["error":"-1" as AnyObject]
    }

}
