//
//  ViewController.swift
//  39_Demo_Switch_Timer
//
//  Created by MeoBeo on 9/10/20.
//  Copyright © 2020 Nguyen Anh Dao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var imgQuat: UIImageView!
    var timer:Timer!
    var goc:Int = 0
    
    @IBAction func sw_CongTac(_ sender: Any) {
        
        if let sw = sender as? UISwitch {
            if sw.isOn {
                timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: { (time) in
                    
                    self.goc += 15
                    self.imgQuat.transform = CGAffineTransform(rotationAngle: (CGFloat(self.goc) * .pi) / 180)
                    
                })
            }
            else {
                timer.invalidate()
                timer = nil
            }
        }
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

