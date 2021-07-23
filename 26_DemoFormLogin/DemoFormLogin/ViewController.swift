//
//  ViewController.swift
//  DemoFormLogin
//
//  Created by MeoBeo on 9/9/20.
//  Copyright © 2020 Nguyen Anh Dao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //@IBOutlet var lblHienThi: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        let alert:UIAlertController = UIAlertController(title: "Đăng Nhập", message: "Vui lòng nhập thông tin", preferredStyle: UIAlertController.Style.alert)
        alert.addTextField { (txtEmail) in
            txtEmail.placeholder = "📩 Nhập Email của bạn"
        }
        alert.addTextField { (txtPassWord) in
            txtPassWord.placeholder = "🔒 Nhập Password của bạn"
            txtPassWord.isSecureTextEntry = true
        }
        let btnLogin:UIAlertAction = UIAlertAction(title: "Đăng Nhậo", style: UIAlertAction.Style.destructive) { (btnLogin) in
            let email:String = alert.textFields![0].text!
            let pass:String = alert.textFields![1].text!
            if email == "nad27298@gmail.com" && pass == "12345" {
                self.thongbaoketqua(mess: "Đăng Nhập Thành Công")
            }
            else {
                self.thongbaoketqua(mess: "Đăng Nhập Thất Bại")
            }
            
        }
        let btnCancel:UIAlertAction = UIAlertAction(title: "Huỷ", style: UIAlertAction.Style.cancel) { (btnCancel) in
        }
        alert.addAction(btnLogin)
        alert.addAction(btnCancel)
        present(alert, animated: true, completion: nil)
        
    }
    
    func thongbaoketqua(mess:String){
      let alert:UIAlertController = UIAlertController(title: "Thông Báo", message: mess, preferredStyle: UIAlertController.Style.alert)
      let btnOk:UIAlertAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil)
      alert.addAction(btnOk)
        present(alert, animated: true, completion: nil)
        
//        lblHienThi.isHidden = false
//        lblHienThi.text = mess

    }

}

