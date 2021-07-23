//
//  ViewController.swift
//  65_Demo_UIScreenEdgePan
//
//  Created by MeoBeo on 9/15/20.
//  Copyright © 2020 Nguyen Anh Dao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var uiView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        uiView.alpha = 0
    }

    @IBAction func screenEdgePan(_ sender: UIScreenEdgePanGestureRecognizer) {
        
        UIView.animate(withDuration: 0.5) {
            self.uiView.alpha = 1
        }
        
    }
    
}

