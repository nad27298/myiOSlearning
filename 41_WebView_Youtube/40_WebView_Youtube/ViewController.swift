//
//  ViewController.swift
//  40_WebView_Youtube
//
//  Created by MeoBeo on 9/10/20.
//  Copyright © 2020 Nguyen Anh Dao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var wvWeb: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url:URL = URL(string: "https://www.youtube.com/watch?v=uR8Mrt1IpXg")!
        let req:URLRequest = URLRequest(url: url)
        wvWeb.loadRequest(req)
    }


}

