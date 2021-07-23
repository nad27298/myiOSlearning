//
//  ViewController.swift
//  47_ChuyenManHinhCode
//
//  Created by MeoBeo on 9/11/20.
//  Copyright © 2020 Nguyen Anh Dao. All rights reserved.
//

import UIKit

//var chuoi:String = ""

class ViewController: UIViewController {
    
    
    let bienDB:UserDefaults = UserDefaults()
    
    @IBOutlet var txtNhap: UITextField!
    
    @IBAction func btnChuyenMH2(_ sender: Any) {
        
        //chuoi = txtNhap.text!
        
        //bienDB.set(txtNhap.text!, forKey: "data")
        
        let scr = storyboard?.instantiateViewController(withIdentifier: "MH2") as! Manhinh2ViewController
        
        scr.dulieu = txtNhap.text!
        //present(scr, animated: true, completion: nil)
        
        navigationController?.pushViewController(scr, animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

