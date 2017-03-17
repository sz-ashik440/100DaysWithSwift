//
//  ViewController.swift
//  06_pull_to_refresh
//
//  Created by Admin on 3/15/17.
//  Copyright © 2017 c4idiots. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    // MARK: Properties
    @IBOutlet weak var fruiteTableView: UITableView!
    
    var fruites: [String] = []
    
    // MARK: Refesh Controller
    var refreshController = UIRefreshControl()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        fruites = ["Apple", "Pineapple", "Orange", "Blackberry", "Banana"]
        
        // giving a string to refresh controller which will show on refreshing
        self.refreshController.attributedTitle = NSAttributedString(string: "Pull to refresh")
        // seting action fro refesh controller
        self.refreshController.addTarget(self, action: #selector(refresh), for: UIControlEvents.valueChanged)
        // adding refresh controller into table voew
        self.fruiteTableView?.addSubview(refreshController)
    }
    
    // MARK: refesh data
    func refresh() {
        fruites = ["Melon", "Strawberry", "Kiwi", "Mango", "Coconut"] + fruites
        
        // ending refresh after adding string into array
        if self.refreshController.isRefreshing {
            self.refreshController.endRefreshing()
        }
        // froce reload table view
        self.fruiteTableView?.reloadData()
    }
    
    // MARK: Number of section In table
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // MARK: Number of row in section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fruites.count
    }
    
    // MARK: setting data into row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        cell.textLabel?.text = fruites[indexPath.row]
        return cell
    }
}

