//
//  ViewController.swift
//  78_Demo_TableView_Cell
//
//  Created by MeoBeo on 9/16/20.
//  Copyright © 2020 Nguyen Anh Dao. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var tblView: UITableView!
    let arrVietNam:Array<Array<String>> = [["Hà Nội", "Hải Phòng"], ["Đà Nẵng"], ["Sài Gòn", "Bình Dương", "Cần Thở"]]
    let arrVietNamHinh:Array<Array<String>> = [["hanoi", "haiphong"], ["danang"], ["saigon", "binhduong", "cantho"]]
    let arrHeader:Array<String> = ["Miền Bắc", "Miền Trung", "Miền Nam"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tblView.dataSource = self
        tblView.delegate = self
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return arrVietNam.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrVietNam[section].count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return arrHeader[section]
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:TableViewCell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! TableViewCell
        cell.lblTen.text = arrVietNam[indexPath.section][indexPath.row]
        cell.imgView.image = UIImage(named: arrVietNamHinh[indexPath.section][indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let manhinh2:MH2ViewController = storyboard?.instantiateViewController(withIdentifier: "MH2") as! MH2ViewController
        manhinh2.ten = arrVietNam[indexPath.section][indexPath.row]
        manhinh2.name = arrVietNamHinh[indexPath.section][indexPath.row]
        self.navigationController?.pushViewController(manhinh2, animated: true)
    }
    
}


