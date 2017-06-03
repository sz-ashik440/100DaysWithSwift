//
//  DetailsTableViewController.swift
//  16_Journal_Core
//
//  Created by Admin on 5/28/17.
//  Copyright © 2017 c4idiots. All rights reserved.
//

import UIKit

class DetailsTableViewController: UITableViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailsLabel: UILabel!
    
    var storyJournal: Entry?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        guard let story = storyJournal else {
            print("Could not recieved from There")
            return
        }
        
        titleLabel.text = story.title
        detailsLabel.text = story.details
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "editSegue" {
            let controller = segue.destination as! EditEntryViewController
            controller.storyJournal = storyJournal
        }
    }
}
