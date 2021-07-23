//
//  ViewController.swift
//  SqliteJson
//
//  Created by MeoBeo on 10/10/20.
//  Copyright © 2020 Nguyen Anh Dao. All rights reserved.
//

import UIKit
import SQLite
import SQLite3

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var tblViewAlpha: UITableView!
    @IBOutlet var tblViewBeta: UITableView!
    var alpha = [Alpha]()
    var beta = [Beta]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tblViewAlpha.dataSource = self
        tblViewBeta.dataSource = self
        tblViewAlpha.delegate = self
        tblViewBeta.delegate = self
        
        if let classalphaQuery: AnySequence<Row> = ClassAlpha.shared.queryAll() {
            for eachClassAlpha in classalphaQuery {
                let json = ClassAlpha.shared.toJSON(classalpha: eachClassAlpha)
                alpha.append(Alpha(alpha: json))
            }
        }

        if let classbetaQuery: AnySequence<Row> = ClassBeta.shared.queryAll() {
            for eachClassBeta in classbetaQuery {
                let json = ClassBeta.shared.toJSON(classbeta: eachClassBeta)
                beta.append(Beta(beta: json))
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == tblViewAlpha {
            return alpha.count
        } else {
            return beta.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == tblViewAlpha {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ClassAlpha") as! ClassAlphaTableViewCell
            cell.fillAlpha(alpha[indexPath.row])
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ClassBeta") as! ClassBetaTableViewCell
            cell.fillBeta(beta[indexPath.row])
            return cell
        }
    }


}

