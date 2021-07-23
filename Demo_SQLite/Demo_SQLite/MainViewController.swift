//
//  MainViewController.swift
//  Demo_SQLite
//
//  Created by MeoBeo on 10/7/20.
//  Copyright © 2020 Nguyen Anh Dao. All rights reserved.
//

import UIKit
import SQLite
import SQLite3

class MainViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var tblViewDepartment: UITableView!
    @IBOutlet var tblViewEmployee: UITableView!
    
    var departments: [[String: Any]] = [[String: Any]]()
    var employee: [[String: Any]] = [[String: Any]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tblViewEmployee.dataSource = self
        tblViewEmployee.delegate = self
        tblViewDepartment.dataSource = self
        tblViewDepartment.delegate = self

//        let department1Id = DepartmentEntity.shared.insert(name: "Financial information department",
//                                                           address: "An example address 1",
//                                                           city: "New York",
//                                                           zipCode: 1111)
//        let department2Id = DepartmentEntity.shared.insert(name: "Department of Leadership",
//                                                           address: "An example address 2",
//                                                           city: "California",
//                                                           zipCode: 2222)
//        let department3Id = DepartmentEntity.shared.insert(name: "Sales Department",
//                                                           address: "An example address 3",
//                                                           city: "Pennsylvania",
//                                                           zipCode: 3333)
//        let department4Id = DepartmentEntity.shared.insert(name: "Investor News Department",
//                                                           address: "An example address 4",
//                                                           city: "Florida",
//                                                           zipCode: 4444)
//        let department5Id = DepartmentEntity.shared.insert(name: "Department of Education and Researching ",
//                                                           address: "An example address 5",
//                                                           city: "Indiana",
//                                                           zipCode: 5555)
//
//        let employee1Id = EmployeeEntity.shared.insert(name: "Luky Skywalker",
//                                                       hireDate: Date(),
//                                                       identifier: "A0001",
//                                                       isManager: true, title: "This is a leader",
//                                                       departmentId: department1Id)
//        let employEee2Id = EmployeeEntity.shared.insert(name: "Ponda Baba ", hireDate: Date(),
//                                                        identifier: "A0002",
//                                                        isManager: false,
//                                                        title: "This is a member",
//                                                        departmentId: department1Id)
//
        
        if let departmentQuery: AnySequence<Row> = DepartmentEntity.shared.queryAll() {
            for eachDepartment in departmentQuery {
//                DepartmentEntity.shared.toString(department: eachDepartment)
                let json = DepartmentEntity.shared.toJSON(department: eachDepartment)
                departments.append(json)
                print("JSON: " + (json["name"] as! String))
            }
        }
        if let employeeQuery: AnySequence<Row> = EmployeeEntity.shared.queryAll() {
            for eachEmplyee in employeeQuery {
//                EmployeeEntity.shared.toString(employee: eachEmplyee)
                let json = EmployeeEntity.shared.toJSON(employee: eachEmplyee)
                print("JSON: " + (json["identifier"] as! String))
                employee.append(json)
            }
        }
 
        
        
        
//        if let departmentQuery: AnySequence<Row> = DepartmentEntity.shared.filterDepartment() {
//            for eachDepartment in departmentQuery {
//              DepartmentEntity.shared.toString(department: eachDepartment)
//            }
//        }
        
//        if let employeeQuery: AnySequence<Row> = EmployeeEntity.shared.filterEmployee() {
//            for eachEmplyee in employeeQuery {
//                EmployeeEntity.shared.toString(employee: eachEmplyee)
//            }
//        }
        
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == tblViewDepartment {
            return departments.count
        } else {
            return employee.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == tblViewDepartment {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Department") as! DepartmentTableViewCell
            cell.lblName.text = (departments[indexPath.row]["name"] as! String)
            cell.lblAdress.text = (departments[indexPath.row]["address"] as! String)
            cell.lblCity.text = (departments[indexPath.row]["city"] as! String)
            cell.lblZipCode.text = String(departments[indexPath.row]["zipCode"] as! Int)
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Employee") as! EmployeeTableViewCell
            cell.lbl2Name.text = (employee[indexPath.row]["name"] as! String)
            cell.lbl2Date.text = (employee[indexPath.row]["hireDate"] as! String)
            cell.lbl2Identifier.text = (employee[indexPath.row]["identifier"] as! String)
            cell.lbl2Manager.text = (employee[indexPath.row]["isManager"] as! Int == 1) ? "YES" : "NO"
            cell.lbl2Title.text = (employee[indexPath.row]["title"] as! String)
            cell.lbl2Department.text = String(employee[indexPath.row]["departmentId"] as! Int)
            return cell
        }
        
    }
    
    
}
