//
//  Appreview.swift
//  AppReview
//
//  Created by MeoBeo on 10/11/20.
//  Copyright © 2020 Nguyen Anh Dao. All rights reserved.
//

import Foundation
import SQLite

class Appreview {
    
    static let shared = Appreview()
    
    private let tblAppreview = Table("tblAppreview")
    
    private let id = Expression<Int64>("id")
    private let image = Expression<String>("image")
    private let trackName = Expression<String>("trackName")
    private let rating = Expression<String>("rating")
    private let trackId = Expression<Int64>("trackId")
    private let description = Expression<String>("description")
    
    private init() {
        // Tạo table nếu không tồn tại
        do {
            if let connection = Database.shared.connection {
                try connection.run(tblAppreview.create(temporary: false, ifNotExists: true, withoutRowid: false, block: { (table) in
                    table.column(self.id, primaryKey: true)
                    table.column(self.image)
                    table.column(self.trackName)
                    table.column(self.rating)
                    table.column(self.trackId)
                    table.column(self.description)
                }))
                print("Creat table tblAppreview successfully")
            } else {
                print("Creat table tblAppreview failed")
            }
        } catch {
            let nserror = error as NSError
            print("Creat table tblAppreview failed. Error is: \(nserror), \(nserror.userInfo)")
        }
    }
    
    // Chèn 1 bản record vào tblDepartment
    func insert(image: String, trackName: String, rating: String, trackId: Int64?, description: String) -> Int64? {
        do {
            let insert = tblAppreview.insert(self.image <- image,
                                             self.trackName <- trackName,
                                             self.rating <- rating,
                                             self.trackId <- trackId ?? 0,
                                             self.description <- description)
            let insertedId = try Database.shared.connection!.run(insert)
            return insertedId
        } catch {
            let nserror = error as NSError
            print("Cannot insert new tblAppreview. Error is: \(nserror), \(nserror.userInfo)")
            return nil
        }
    }
    
    // Truy vấn tất cả đên tblDepartment
    func queryAll() -> AnySequence<Row>? {
        do {
            return try Database.shared.connection?.prepare(self.tblAppreview)
        } catch {
            let nserror = error as NSError
            print("Cannot querry(list) tblAppreview. Error is: \(nserror), \(nserror.userInfo)")
            return nil
        }
    }
    
    // Tạo bản in print kiểm tra
    func toString(classappreview: Row) {
        print("""
            Department details.
            id = \(classappreview[self.id]),
            image = \(classappreview[self.image]),
            trackName = \(classappreview[self.trackName]),
            rating = \(classappreview[self.rating]),
            trackId = \(classappreview[self.trackId]),
            description = \(classappreview[self.description]))
            """)
    }
    
    // Tạo ngôn ngữ JSON
    func toJSON(appreview: Row) -> [String: Any] {
        let sqlResult = """
        {"id": \(appreview[self.id]),
        "image": "\(appreview[self.image])",
        "trackName": "\(appreview[self.trackName])",
        "rating": "\(appreview[self.rating])",
        "trackId": \(appreview[self.trackId]),
        "description": "\(appreview[self.description])"}
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
