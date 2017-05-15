//
//  ViewController.swift
//  13_Contacts_SQLite
//
//  Created by Admin on 4/27/17.
//  Copyright © 2017 c4idiots. All rights reserved.
//

import UIKit



class ViewController: UITableViewController {
    
    var contactData:[ContactPhone] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        DBManager.instance.createTable()
        
//        let cont1 = ContactDataHelper.insert(item: Contact(name: "sz", address: "123 Street"))
//        print(cont1)
//        
//        let cont2 = ContactDataHelper.insert(item: Contact(name: "ds", address: "123 Street"))
//        print(cont2)
//        let cont3 = ContactDataHelper.insert(item: Contact(name: "fd", address: "123 Street"))
//        print(cont3)
//        let phone1 = PhoneDataHelper.insert(item: Phone(contactID: cont1, type: "Home", number: "01672131243"))
//        print(phone1)
//        let phone2 = PhoneDataHelper.insert(item: Phone(contactID: cont1, type: "Office", number: "9673291"))
//        print(phone2)
        
        contactData = ContactDataHelper.getAll()!
        for contactPhone in contactData{
            let contact = contactPhone.contact
            let phone = contactPhone.phones
            print(contact.name)
            for ph in phone{
                print("\(ph.number)(\(ph.type))")
            }
        }
        
//        DBManager.instance.dropTable()
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactData.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        let contact = contactData[indexPath.row].contact
        let phone = contactData[indexPath.row].phones
        cell?.textLabel?.text = contact.name
        cell?.detailTextLabel?.text = "\(phone[0].number)(\(phone[0].type))"
        return cell!
    }
}

