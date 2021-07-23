//
//  ViewController.swift
//  93_Demo_XemVideo
//
//  Created by MeoBeo on 9/17/20.
//  Copyright © 2020 Nguyen Anh Dao. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class ViewController: UIViewController {
    
    var playerController:AVPlayerViewController!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        playerController = AVPlayerViewController()
//        let path:String = Bundle.main.path(forResource: "sample-mp4-file", ofType: ".mp4")!
//        let url:URL = URL(fileURLWithPath: path)
        let url: URL = URL(string: "https://tv.cdn.xsg.ge/gpb-1tv/index.m3u8")!
        
        playerController.player = AVPlayer(url: url)
        playerController.view.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height / 3)
        view.addSubview(playerController.view)
        self.playerController.player?.play()
    }

    @IBAction func btnASHow(_ sender: Any) {
        
        present(playerController, animated: true) {
//            self.playerController.player?.play()
        }
        
    }
}


