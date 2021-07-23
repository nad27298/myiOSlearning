//
//  ViewController.swift
//  71_Demo_UIPickerView_Basic
//
//  Created by MeoBeo on 9/16/20.
//  Copyright © 2020 Nguyen Anh Dao. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    @IBOutlet var pickerDanhSach: UIPickerView!
    let arrayDuLieu:Array<Array<String>> = [["Hello", "Hi", "Xin Chào", "Chào các bạn", "Anh Đào"], ["iOS", "Android", "Unity", "PHP"], ["Swift", "Java", "C++"], ["ABC", "XYZ"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerDanhSach.delegate = self
        pickerDanhSach.dataSource = self
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return arrayDuLieu.count
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return arrayDuLieu[component].count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return arrayDuLieu[component][row]
    }


}

