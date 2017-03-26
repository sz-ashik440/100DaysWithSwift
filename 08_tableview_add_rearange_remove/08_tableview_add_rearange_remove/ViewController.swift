//
//  ViewController.swift
//  08_tableview_add_rearange_remove
//
//  Created by Admin on 3/18/17.
//  Copyright © 2017 c4idiots. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // MARK: Properties
    @IBOutlet weak var todoTable: UITableView!
    
    // MARK: ViewDidLoad method
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: RowNumber in tableview
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoData.count
    }
    
    // MARK: Set cell for tableview
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        
        cell.textLabel?.text = todoData[indexPath.row]
        
        return cell
    }
    
    // MARK: EditNavigationButton set up
    @IBAction func editTableData(_ sender: UIBarButtonItem) {
        // set editable state for tableview
        todoTable.setEditing(!todoTable.isEditing, animated: true)
        
        // toggle navigation button
        if todoTable.isEditing == true {
            navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Done",
                                                                style: UIBarButtonItemStyle.plain,
                                                                target: self,
                                                                action: #selector(editTableData))
        } else {
            navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Edit",
                                                                style: UIBarButtonItemStyle.plain,
                                                                target: self,
                                                                action: #selector(editTableData))
        }
    }
    
    // MARK: Enable editable state
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    // MARK: Remove row 
    // -from data source and also remove row from tableview
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            todoData.remove(at: indexPath.row)
            todoTable.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    //MARK: Move row in table view
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        
        let todoTemp = todoData[sourceIndexPath.row]
        todoData.remove(at: sourceIndexPath.row)
        todoData.insert(todoTemp, at: destinationIndexPath.row)
    }
    
    // MARK: unwind segue
    // - from newentry viewcontroller
    @IBAction func unwindBackData(sender: UIStoryboardSegue) {
        if let recivedVC = sender.source as? NewEntryViewController {
            if let data = recivedVC.passedData {
                todoData.append(data)
            }else {
                print("Something went wrong in unwinding")
            }
        }
        todoTable.reloadData()
    }
}

