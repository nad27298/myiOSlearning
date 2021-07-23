//
//  AlbumTableViewCell.swift
//  Demo_Alamofire
//
//  Created by MeoBeo on 10/2/20.
//  Copyright © 2020 Nguyen Anh Dao. All rights reserved.
//

import UIKit

class AlbumTableViewCell: UITableViewCell {
    @IBOutlet var nameLable: UILabel!
    @IBOutlet var singerLable: UILabel!
    @IBOutlet var releaseLable: UILabel!
    @IBOutlet var trackLable: UILabel!
    @IBOutlet var kindLable: UILabel!
    @IBOutlet var imgHinh: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func fillData(_ data:Album) {
        nameLable.text = data.artistName
        singerLable.text = data.trackName
        releaseLable.text = data.releaseDate
        trackLable.text = data.trackCensoredName
        kindLable.text = data.kind
        let url = URL(string: data.artworkUrl60)
        do {
            let imgData:Data = try Data(contentsOf: url!)
            imgHinh.image = UIImage(data: imgData)
        }catch{}
    }

}
