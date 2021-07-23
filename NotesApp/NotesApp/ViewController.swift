//
//  ViewController.swift
//  NotesApp
//
//  Created by MeoBeo on 10/17/20.
//  Copyright © 2020 Nguyen Anh Dao. All rights reserved.
//

import UIKit
import SQLite
import SQLite3

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tblView: UITableView!
    
    var arraynote = [AppNotes]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tblView.delegate = self
        tblView.dataSource = self
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if let appnotesQuery: AnySequence<Row> = Notes.shared.queryAll() {
            arraynote.removeAll()
            for eachappnotes in appnotesQuery {
                let json = Notes.shared.toJSON(appreview: eachappnotes)
                arraynote.append(AppNotes(data: json))
                tblView.reloadData()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arraynote.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Notes") as! NotesTableViewCell
        cell.fillData(arraynote[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let data = arraynote[indexPath.row]
//        Notes.shared.update(id: data.id, notes: data.notes, check: !data.check, time: data.time)
//        // Load lại cell sau khi update data
//        data.check = !data.check
//        let cell = tableView.cellForRow(at: indexPath) as! NotesTableViewCell
//        cell.fillData(data)
//        // Xoá bỏ màu xám sau khi chọn cell
        tableView.deselectRow(at: indexPath, animated: true)
        let mh2:MH2ViewController = storyboard?.instantiateViewController(withIdentifier: "MH2") as! MH2ViewController
        mh2.dulieu = arraynote[indexPath.row]
        self.navigationController?.pushViewController(mh2, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let data = arraynote[indexPath.row]
            _ = Notes.shared.delete(id: data.id)
            arraynote.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    
}
