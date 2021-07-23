//
//  ViewController.swift
//  86_Demo_ScrollView
//
//  Created by MeoBeo on 9/17/20.
//  Copyright © 2020 Nguyen Anh Dao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Bước 1: Làm Layout
        let scroll:UIScrollView = UIScrollView()
        view.addSubview(scroll)
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        scroll.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        scroll.widthAnchor.constraint(equalToConstant: 200).isActive = true
        scroll.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        // Bước 2: Xác định biên
        let viewxanh:UIView  = UIView()
        viewxanh.backgroundColor = #colorLiteral(red: 0.4645749349, green: 1, blue: 0.4106315295, alpha: 1)
        scroll.addSubview(viewxanh)
        viewxanh.translatesAutoresizingMaskIntoConstraints = false
        viewxanh.topAnchor.constraint(equalTo: scroll.topAnchor).isActive = true
        viewxanh.bottomAnchor.constraint(equalTo: scroll.bottomAnchor).isActive = true
        viewxanh.leftAnchor.constraint(equalTo: scroll.leftAnchor).isActive = true
        viewxanh.rightAnchor.constraint(equalTo: scroll.rightAnchor).isActive = true
        
        // Bước 3: Xác định kích thước nội dung
        viewxanh.widthAnchor.constraint(equalToConstant: 400).isActive = true
        viewxanh.heightAnchor.constraint(equalToConstant: 400).isActive = true
        
    }


}

