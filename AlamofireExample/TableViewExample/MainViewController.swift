//
//  MainViewController.swift
//  TableViewExample
//
//  Created by Nguyen Duc Hoang on 8/27/17.
//  Copyright © 2017 Nguyen Duc Hoang. All rights reserved.
//

import UIKit
import Alamofire

class MainViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView?
    var foods: [[String: Any]] = [[String: Any]]()
    override func viewDidLoad() {
        super.viewDidLoad()
        Alamofire.request("https://itunes.apple.com/search?term=xxx&country=us&entity=software").responseJSON { (response) in
            if let responseValue = response.result.value as! [String: Any]? {
                if let responseFoods = responseValue["results"] as! [[String: Any]]? {
                    self.foods = responseFoods
                    self.tableView?.reloadData()
                }
            }
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foods.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FoodTableViewCell") as! FoodTableViewCell
        if foods.count > 0 {
            let eachFood = foods[indexPath.row]
            cell.lblFoodName?.text = (eachFood["artistName"] as? String) ?? ""
            cell.lblDescription?.text = (eachFood["trackName"] as? String) ?? ""
            let url = URL(string: (eachFood["artworkUrl60"] as? String) ?? "")
            do {
                let imgData:Data = try Data(contentsOf: url!)
                cell.imageViewFood?.image = UIImage(data: imgData)
            }catch{}
        }
        return cell
    }
}
