//
//  ViewController.swift
//  89_Demo_PhatNhac
//
//  Created by MeoBeo on 9/17/20.
//  Copyright © 2020 Nguyen Anh Dao. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet var sldTime: UISlider!
    @IBOutlet var sldVolume: UISlider!
    
    var player:AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //        let path:String = Bundle.main.path(forResource: "Em Cua Ngay Hom Qua", ofType: ".mp3")!
        //        let url:URL = URL(fileURLWithPath: path)
        let url:URL = URL(fileURLWithPath: "/Users/Applehouse/Desktop/Music/02 Remember Me.mp3")
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player.play()
            sldTime.maximumValue = Float(player.duration)
            
            Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block:  { (time) in
                self.sldTime.value = Float(self.player.currentTime)
            })
            
            player.volume = 0.5
        }
        catch{
            print("Lỗi phát nhạc")
        }
        
    }
    @IBAction func sld_Volume(_ sender: Any) {
        
        player.volume = sldVolume.value
        
    }
    
    
    
}

