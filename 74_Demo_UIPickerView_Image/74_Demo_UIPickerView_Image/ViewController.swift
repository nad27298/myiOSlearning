//
//  ViewController.swift
//  74_Demo_UIPickerView_Image
//
//  Created by MeoBeo on 9/16/20.
//  Copyright © 2020 Nguyen Anh Dao. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    @IBOutlet var myPicker: UIPickerView!
    @IBOutlet var imgHinh: UIImageView!
    
    
    var arrayHinh:Array<String> = ["img1", "img2", "img3", "img4", "img5", "img6", "img7", "img8", "img9", "img10"]
    override func viewDidLoad() {
        super.viewDidLoad()
        myPicker.delegate = self
        myPicker.dataSource = self
        myPicker.selectRow(5, inComponent: 0, animated: true)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return arrayHinh.count
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let img:UIImageView = UIImageView()
        img.image = UIImage(named: arrayHinh[row])
        img.contentMode = .scaleAspectFit
        return img
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 100
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        imgHinh.image = UIImage(named: arrayHinh[row])
    }

}

