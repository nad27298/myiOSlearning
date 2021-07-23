//
//  ViewController.swift
//  41_Demo_WebView_Web_1
//
//  Created by MeoBeo on 9/10/20.
//  Copyright © 2020 Nguyen Anh Dao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var LichSu:Array<String> = Array<String>()
    var vitri:Int = 0
    
    @IBAction func btnTroVe(_ sender: Any) {
        if LichSu.count > 0 {
            vitri = vitri - 1
            if vitri < 0 {
                vitri = 0
            }
            let url:URL = URL(string: LichSu[vitri])!
            let req:URLRequest = URLRequest(url: url)
            wvTrinhDuyet.loadRequest(req)
        }
    }
    
    @IBAction func btnKeTiep(_ sender: Any) {
        if LichSu.count > 0 {
            vitri = vitri + 1
            if vitri > LichSu.count - 1 {
                vitri = LichSu.count - 1
            }
            let url:URL = URL(string: LichSu[vitri])!
            let req:URLRequest = URLRequest(url: url)
            wvTrinhDuyet.loadRequest(req)
        }
    }
    
    @IBAction func btnLoadLaiTrang(_ sender: Any) {
        wvTrinhDuyet.reload()
    }
    
    @IBAction func btnTimKiem(_ sender: Any) {
//        let url = URL(string: txtDuongDan.text!)
//        if url != nil{
          if let url = URL(string: txtDuongDan.text!) {
            var link:String = txtDuongDan.text!
            if link.hasPrefix("https://") {
                let req:URLRequest = URLRequest(url: url)
                wvTrinhDuyet.loadRequest(req)
                LichSu.append(link)
            }
            else {
                link = "https://\(link)"
                let url2:URL = URL(string: link)!
                let req:URLRequest = URLRequest(url: url2)
                wvTrinhDuyet.loadRequest(req)
                LichSu.append(link)
            }
            vitri = LichSu.count - 1
            
        }
        else {
            print("Lỗi đường dẫn url")
        }
        
        
    }
    
    @IBOutlet var txtDuongDan: UITextField!
    @IBOutlet var wvTrinhDuyet: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

