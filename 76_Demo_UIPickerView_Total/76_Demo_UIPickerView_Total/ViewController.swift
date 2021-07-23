//
//  ViewController.swift
//  76_Demo_UIPickerView_Total
//
//  Created by MeoBeo on 9/16/20.
//  Copyright © 2020 Nguyen Anh Dao. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet var lblTen: UILabel!
    @IBOutlet var imgHinh: UIImageView!
    @IBOutlet var pickerHinh: UIPickerView!
    let arrayHinh:Array<Array<String>> = [["img1", "img2", "img3", "img4", "img5", "img6"], ["img7", "img8", "img9", "img10", "img11"]]
    
    let arrTen:Array<Array<String>> = [["Hình số 1", "Hình số 2", "Hình số 3", "Hình số 4", "Hình số 5", "Hình số 6"], ["Hình số 7", "Hình số 8", "Hình số 9", "Hình số 10", "Hình số 11"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerHinh.delegate = self
        pickerHinh.dataSource = self
        lblTen.text = arrTen[0][0]
        imgHinh.image = UIImage(named: arrayHinh[0][0])
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return arrTen.count
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return arrTen[component].count
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let m_view:UIView = UIView()
        m_view.frame = CGRect(x: 0, y: 0, width: pickerView.frame.width / 2, height: 200)
        
        let img:UIImageView = UIImageView()
        img.image = UIImage(named: arrayHinh[component][row])
        img.frame = CGRect(x: 0, y: 0, width: m_view.frame.width, height: m_view.frame.height)
        img.contentMode = .scaleAspectFit
        img.clipsToBounds = true
        
        let lbl:UILabel = UILabel()
        lbl.text = arrTen[component][row]
        lbl.frame = CGRect(x: 0, y: m_view.frame.height - 30, width: m_view.frame.width, height: 30)
        
        m_view.addSubview(img)
        m_view.addSubview(lbl)
        
        return m_view
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 200
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        lblTen.text = arrTen[component][row]
        imgHinh.image = UIImage(named: arrayHinh[component][row])
    }
    
    


}

