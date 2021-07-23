//
//  ViewController.swift
//  36_Demo_Switch
//
//  Created by MeoBeo on 9/10/20.
//  Copyright © 2020 Nguyen Anh Dao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var imgHinh: UIImageView!
    @IBOutlet var swCongTac: UISwitch!
    
    @IBAction func sw_CongTac(_ sender: Any) {
        
        if swCongTac.isOn {
           imgHinh.image = UIImage(named: "denmo")
        }
        else {
           imgHinh.image = UIImage(named: "dentat")
        }
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        swCongTac.isOn = false
        
    }


}

