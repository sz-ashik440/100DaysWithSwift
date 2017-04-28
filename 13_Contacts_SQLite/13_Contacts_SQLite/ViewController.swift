//
//  ViewController.swift
//  13_Contacts_SQLite
//
//  Created by Admin on 4/27/17.
//  Copyright © 2017 c4idiots. All rights reserved.
//

import UIKit



class ViewController: UITableViewController {
    
    var contactData:[Contact] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        DBManager.instance.createTable()
        
        let cont1 = ContactDataHelper.insert(item: Contact(name: "sz", address: "123 Street"))
        print(cont1)
//        let cont2 = ContactDataHelper.insert(item: Contact(name: "ds", address: "123 Street"))
//        print(cont2)
//        let cont3 = ContactDataHelper.insert(item: Contact(name: "fd", address: "123 Street"))
//        print(cont3)
        let phone1 = PhoneDataHelper.insert(item: Phone(userID: cont1, type: "Home", number: "018923123242"))
        print(phone1)
        
//        contactData = ContactDataHelper.getAll()!
//        for contact in contactData{
//            print(contact.name)
//        }
        
        // ContactDataHelper.dropTable()
        // PhoneDataHelper.dropTable()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactData.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = contactData[indexPath.row].name
        cell?.detailTextLabel?.text = contactData[indexPath.row].address
        return cell!
    }
}

