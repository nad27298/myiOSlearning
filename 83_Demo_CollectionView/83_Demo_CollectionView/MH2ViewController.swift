//
//  MH2ViewController.swift
//  83_Demo_CollectionView
//
//  Created by MeoBeo on 9/17/20.
//  Copyright © 2020 Nguyen Anh Dao. All rights reserved.
//

import UIKit

class MH2ViewController: UIViewController {

    @IBOutlet var imgView2: UIImageView!
    var hinh:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imgView2.image = UIImage(named: hinh)

    }
    

    

}
