//
//  ViewController.swift
//  34_DemoSlider
//
//  Created by MeoBeo on 9/10/20.
//  Copyright © 2020 Nguyen Anh Dao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var sliRed: UISlider!
    @IBOutlet var sliGreen: UISlider!
    @IBOutlet var sliBlue: UISlider!
    
    
    @IBAction func sli_chonmau(_ sender: UISlider) {
        
        view.backgroundColor = UIColor(red: CGFloat(sliRed.value), green: CGFloat(sliGreen.value), blue: CGFloat(sliBlue.value), alpha: 1)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

