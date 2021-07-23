//
//  ViewController.swift
//  58_Demo_UIRotation
//
//  Created by MeoBeo on 9/15/20.
//  Copyright © 2020 Nguyen Anh Dao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func rotation(_ sender: Any) {
        
        let rota = sender as! UIRotationGestureRecognizer
        rota.view?.transform = (rota.view?.transform.rotated(by: rota.rotation))!
        rota.rotation = 0
    
    }
    

}

