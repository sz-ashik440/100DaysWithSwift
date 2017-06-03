//
//  EntryViewController.swift
//  16_Journal_Core
//
//  Created by Admin on 5/26/17.
//  Copyright © 2017 c4idiots. All rights reserved.
//

import UIKit
import CoreData

class EntryViewController: UITableViewController {
    
    var entries: [Entry] = []

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // get appdelegate so that persistence can be used
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else{
            return
        }
        // get context
        let managedContex = appDelegate.persistentContainer.viewContext
        
        do{
            // fetch data from core data
            entries = try managedContex.fetch(Entry.fetchRequest())
        } catch let error as NSError{
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        
        // reload table
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return entries.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! EntryTableViewCell
        
        let story = entries[indexPath.row]
        cell.entryTitleLabel.text = story.value(forKey: "title") as? String
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    // MARK:- Deleting from core data
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let delete = UITableViewRowAction(style: .default, title: "Delete") { (action, indexPath) in
            
            let item = self.entries[indexPath.row]
            
            guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else{
                return
            }
            
            let managedContex = appDelegate.persistentContainer.viewContext
            
            managedContex.delete(item)
            appDelegate.saveContext()
            
            self.entries.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        
        delete.backgroundColor = UIColor.cyan
        
        return [delete]
    }
    
    // MARK:- show details of the entry
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "detailsSegue", sender: indexPath)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailsSegue" {
            let controller = segue.destination as! DetailsTableViewController
            let index = sender as! NSIndexPath
            controller.storyJournal = self.entries[index.row]
        }
    }
}

