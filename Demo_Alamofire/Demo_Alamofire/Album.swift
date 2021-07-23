//
//  Album.swift
//  Demo_Alamofire
//
//  Created by MeoBeo on 10/2/20.
//  Copyright © 2020 Nguyen Anh Dao. All rights reserved.
//

import Foundation

final class Album {
    
    var artistName = ""
    var trackName = ""
    var releaseDate = ""
    var trackCensoredName = ""
    var kind = ""
    var artworkUrl60 = ""
    
    init(data: [String: Any]) {
        if let artistName = data["artistName"] as? String {
            self.artistName = artistName
        }
        if let trackName = data["trackName"] as? String {
            self.trackName = trackName
        }
        if let releaseDate = data["releaseDate"] as? String {
            self.releaseDate = releaseDate
        }
        if let trackCensoredName = data["trackCensoredName"] as? String {
            self.trackCensoredName = trackCensoredName
        }
        if let kind = data["kind"] as? String {
            self.kind = kind
        }
        if let artworkUrl60 = data["artworkUrl60"] as? String {
            self.artworkUrl60 = artworkUrl60
        }
        
    }

}
