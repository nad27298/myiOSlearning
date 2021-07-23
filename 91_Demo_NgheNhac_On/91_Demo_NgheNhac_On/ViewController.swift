//
//  ViewController.swift
//  91_Demo_NgheNhac_On
//
//  Created by MeoBeo on 9/17/20.
//  Copyright © 2020 Nguyen Anh Dao. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player:AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url:URL = URL(string: "https://vnno-vn-5-tf-mp3-s1-zmp3.zadn.vn/97a5efaaceed27b37efc/807072004267456758?authen=exp=1600436048~acl=/97a5efaaceed27b37efc/*~hmac=10116ab7fd01467b44a9ed46e55d4a58&filename=Psycho-Red-Velvet.mp3")!
        
        do {
            let data:Data = try Data(contentsOf: url)
            do {
                player = try AVAudioPlayer(data: data)
                player.play()
            }
            catch {
                print("Lỗi phát nhạc")
            }
        }
        catch {}
        
    
        
        
        
    }


}

