//
//  ViewController.swift
//  17_xml_parsing
//
//  Created by Admin on 6/4/17.
//  Copyright © 2017 c4idiots. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var bookList: [Book] = []

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        guard let path = Bundle.main.url(forResource: "book", withExtension: "xml") else {
            print("XML file Couldn't found")
            return
        }
        
        do{
            let xmlData = try Data(contentsOf: path)
            let parser = Parser(data: xmlData)
            bookList = parser.parseBook()
        } catch{
            print(error.localizedDescription)
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bookList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        let book = bookList[indexPath.row]
        
        cell.textLabel?.text = book.title
        cell.detailTextLabel?.text = book.author
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let book = self.bookList[indexPath.row]
        performSegue(withIdentifier: "detailsSegue", sender: book)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailsSegue" {
            let controller = segue.destination as! DetailsViewController
            controller.book = sender as? Book
        }
    }
}

