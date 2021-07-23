//
//  ViewController.swift
//  63_Demo_UIPan
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

    @IBAction func panGusture(_ sender: UIPanGestureRecognizer) {
        
        let vitri = sender.translation(in: view)
        sender.view?.transform = (sender.view?.transform.translatedBy(x: vitri.x, y: vitri.y))!
        sender.setTranslation(CGPoint.zero, in: view)
        
    }
    
}

