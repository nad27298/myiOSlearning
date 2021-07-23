//
//  ViewController.swift
//  Demo_Alamofire
//
//  Created by MeoBeo on 10/2/20.
//  Copyright © 2020 Nguyen Anh Dao. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    @IBOutlet var albumIdTextField: UITextField!
    @IBOutlet var albumTableView: UITableView!
    
    private var albumDatas = [Album]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sendGetRequest()
    }
    
    private func sendGetRequest() {
        
        guard let url = URL(string: "https://itunes.apple.com/search?term=xxx&country=us&entity=software") else {
            return
        }
        Alamofire.request(url).responseJSON { [weak self] (response) in
            self?.handleParseData(response)
        }
        
    }
    
    private func sendPostRequest(_ params: [String: Any]?) {
        
        guard let url = URL(string: "https://itunes.apple.com/search?term=xxx&country=us&entity=software") else {
            return
        }
        Alamofire.request(url, method: .post, parameters: params, headers: nil).responseJSON { [weak self] (response) in
            self?.handleParseData(response)
        }
        
    }
    
    private func handleParseData(_ data: DataResponse<Any>) {
        
        switch data.result {
        case .success(let value):
            guard let data2 = value as? [String: Any],
                let dataObject = data2["results"] as? [[String: Any]] else {
                    return
            }
            albumDatas.removeAll()
            dataObject.forEach { (dataObjc) in
                albumDatas.append(Album(data: dataObjc))
            }
            albumIdTextField.text = nil
            albumTableView.reloadData()
        case .failure(let error):
            print("ERROR FORM SERER \(error)")
        }
        
    }
    
    @IBAction private func requestButtomAction(_ sender: Any) {
        
        if let text = albumIdTextField.text, let albumID = Int(text) {
            sendPostRequest(["trackId": albumID])
        }else{
            sendPostRequest(nil)
        }
        
    }
    
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albumDatas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = albumTableView.dequeueReusableCell(withIdentifier: "AlbumCell", for: indexPath) as! AlbumTableViewCell
        cell.fillData(albumDatas[indexPath.row])
        return cell
    }
    
}
