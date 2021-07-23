//
//  ViewController.swift
//  70_Demo_MotionShake
//
//  Created by MeoBeo on 9/15/20.
//  Copyright © 2020 Nguyen Anh Dao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var imgHinh: UIImageView!
    var y:CGFloat = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { (time) in
            self.y += 10
            UIView.animate(withDuration: 0.6, animations: {
                self.imgHinh.layer.transform = CATransform3DMakeTranslation(0, self.y, 0)

            })
        }
    }
        

    override func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
//        if motion == UIEvent.EventSubtype.motionShake {
//            self.y += 10
//            UIView.animate(withDuration: 0.6, animations: {
//                self.imgHinh.layer.transform = CATransform3DMakeTranslation(0, self.y, 0)
//            }) { (finish) in
//                self.y -= 15
//                UIView.animate(withDuration: 0.6, animations: {
//                    self.imgHinh.layer.transform = CATransform3DMakeTranslation(0, self.y, 0)
//
//                })
//            }
//
//        }
        
        y -= 15
        if motion == UIEvent.EventSubtype.motionShake {

            UIView.animate(withDuration: 0.2) {

                self.imgHinh.layer.transform = CATransform3DMakeTranslation(0, self.y, 0)

           }

        }
    
    }
    
}

