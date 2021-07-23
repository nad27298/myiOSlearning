//
//  MH2ViewController.swift
//  AppReview
//
//  Created by MeoBeo on 10/11/20.
//  Copyright © 2020 Nguyen Anh Dao. All rights reserved.
//

import UIKit
import SQLite

class MH2ViewController: UIViewController {
    @IBOutlet var imgImage: UIImageView!
    @IBOutlet var lblTrackName: UILabel!
    @IBOutlet var lblRating: UILabel!
    @IBOutlet var lblTrackId: UILabel!
    @IBOutlet var lblDescription: UILabel!
    
    var app:AppReview!

    override func viewDidLoad() {
        super.viewDidLoad()
        imgImage.image = UIImage(named: app.image)
        lblTrackName.text = app.trackName
        lblRating.text = app.rating
        lblTrackId.text = String(app.trackId)
        lblDescription.text = app.description
//        fillMH2(app)
    }
    
//    func fillMH2 (_ data: AppReview) {
//
//        imgImage.image = UIImage(named: data.image)
//        lblTrackName.text = data.trackName
//        lblRating.text = data.rating
//        lblTrackId.text = String(data.trackId)
//        lblDescription.text = data.description
//    }
    
}


