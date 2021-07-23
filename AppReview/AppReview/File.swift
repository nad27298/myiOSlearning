//
//  File.swift
//  AppReview
//
//  Created by MeoBeo on 10/11/20.
//  Copyright © 2020 Nguyen Anh Dao. All rights reserved.
//

import Foundation
import SQLite

final class AppReview {
    
    var image = String()
    var trackName = String()
    var rating = String()
    var trackId = Int()
    var description = String()
    
    init(data: [String: Any]) {
        if let image = data["image"] as? String {
            self.image = image
        }
        if let trackName = data["trackName"] as? String {
            self.trackName = trackName
        }
        if let rating = data["rating"] as? String {
            self.rating = rating
        }
        if let trackId = data["trackId"] as? Int {
            self.trackId = trackId
        }
        if let description = data["description"] as? String {
            self.description = description
        }
    }


}
