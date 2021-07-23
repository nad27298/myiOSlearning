//
//  ViewController.swift
//  AppReview
//
//  Created by MeoBeo on 10/11/20.
//  Copyright © 2020 Nguyen Anh Dao. All rights reserved.
//

import UIKit
import SQLite
import SQLite3

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var tblView: UITableView!
    
    
    var ungdung = [AppReview]()

    override func viewDidLoad() {
        super.viewDidLoad()
        tblView.dataSource = self
        tblView.delegate = self
        

        if let appreviewQuery: AnySequence<Row> = Appreview.shared.queryAll() {
            for eachappreview in appreviewQuery {
                let json = Appreview.shared.toJSON(appreview: eachappreview)
                ungdung.append(AppReview(data: json))
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ungdung.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AppReview") as! AppReviewTableViewCell
        let data = ungdung[indexPath.row]
        cell.imgImage.image = UIImage(named: data.image)
        cell.lblTrackName.text = data.trackName
        cell.lblRating.text = data.rating
        cell.lblTrackId.text = String(data.trackId)
        cell.lblDescription.text = data.description
//        cell.fillData(ungdung[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let mh2:MH2ViewController = storyboard?.instantiateViewController(withIdentifier: "MH2") as! MH2ViewController
        mh2.app = ungdung[indexPath.row]
        self.navigationController?.pushViewController(mh2, animated: true)
    }

}
