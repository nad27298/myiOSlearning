//
//  Manhinh2ViewController.swift
//  47_ChuyenManHinhCode
//
//  Created by MeoBeo on 9/11/20.
//  Copyright © 2020 Nguyen Anh Dao. All rights reserved.
//

import UIKit

//var chuoi_2:String = ""

class Manhinh2ViewController: UIViewController {
    
    @IBOutlet var lblHienThi: UILabel!
    //let biendb:UserDefaults = UserDefaults()
    
    var dulieu:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //let chuoi2:String = biendb.object(forKey: "data") as! String
        //lblHienThi.text = chuoi2
        
        //lblHienThi.text = chuoi
        lblHienThi.text = dulieu

        // Do any additional setup after loading the view.
    }
    

}
