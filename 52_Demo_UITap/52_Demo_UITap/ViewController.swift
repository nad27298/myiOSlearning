//
//  ViewController.swift
//  52_Demo_UITap
//
//  Created by MeoBeo on 9/12/20.
//  Copyright © 2020 Nguyen Anh Dao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func tab_View(_ sender: Any) {
        let tap:UITapGestureRecognizer = sender as! UITapGestureRecognizer
        print(tap.location(in: view))
        
        let img:UIImageView = UIImageView()
        img.image = UIImage(named: "poke")
        img.frame.size = CGSize(width: 80, height: 80)
        img.center = tap.location(in: view)
        view.addSubview(img)
        
        let lbl = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 100))
        lbl.text = "TEST"
        view.addSubview(lbl)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

