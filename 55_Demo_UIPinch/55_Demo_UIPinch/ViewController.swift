//
//  ViewController.swift
//  55_Demo_UIPinch
//
//  Created by MeoBeo on 9/15/20.
//  Copyright © 2020 Nguyen Anh Dao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBAction func pinchimg(_ sender: UIPinchGestureRecognizer) {
        sender.view?.transform = (sender.view?.transform.scaledBy(x: sender.scale, y: sender.scale))!
        sender.scale = 1
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

