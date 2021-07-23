//
//  ViewController.swift
//  60_Demo_UISwipe
//
//  Created by MeoBeo on 9/15/20.
//  Copyright © 2020 Nguyen Anh Dao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var imgHinh: UIImageView!
    var goc:CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func swipeGesture(_ sender: Any) {
        
        UIView.animate(withDuration: 0.5) {
            self.goc += 45
            self.imgHinh.layer.transform = CATransform3DMakeRotation(.pi * self.goc / 180, 0, 0, 1)
        }
        
    }
    
}

