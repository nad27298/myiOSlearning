//
//  ViewController.swift
//  68_Demo_UILongGusture
//
//  Created by MeoBeo on 9/15/20.
//  Copyright © 2020 Nguyen Anh Dao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func longGustureAImg(_ sender: UILongPressGestureRecognizer) {
        
        if sender.state == .began {
            let alert:UIAlertController = UIAlertController(title: "Thông Báo", message: "Đây là con Pikachu", preferredStyle: UIAlertController.Style.alert)
            let btOk:UIAlertAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.destructive, handler: nil)
            alert.addAction(btOk)
            present(alert, animated: true, completion: nil)
        }
        
    }
    
}

