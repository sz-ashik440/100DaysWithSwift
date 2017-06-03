//
//  DetailsViewController.swift
//  17_xml_parsing
//
//  Created by Admin on 6/4/17.
//  Copyright © 2017 c4idiots. All rights reserved.
//

import UIKit

class DetailsViewController: UITableViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var publishDateLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    var book: Book?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        guard let recivedBook = book else{
            print("No book recived")
            return
        }
        
        titleLabel.text = recivedBook.title
        authorLabel.text = recivedBook.author
        genreLabel.text = recivedBook.genre
        publishDateLabel.text = recivedBook.publish_date
        priceLabel.text = "$\(recivedBook.price!)"
        descriptionLabel.text = recivedBook.description
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
}
