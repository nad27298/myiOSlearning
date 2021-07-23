//
//  MH2ViewController.swift
//  78_Demo_TableView_2
//
//  Created by MeoBeo on 9/17/20.
//  Copyright © 2020 Nguyen Anh Dao. All rights reserved.
//

import UIKit

class MH2ViewController: UIViewController {
    @IBOutlet var lblTen2: UILabel!
    @IBOutlet var imgView2: UIImageView!
    var name:String!
    var ten:String!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        imgView2.image = UIImage(named: name)
        lblTen2.text = ten
    }
    
}
