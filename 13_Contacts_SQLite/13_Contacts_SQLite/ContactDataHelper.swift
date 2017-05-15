//
//  ContactDataHelper.swift
//  13_Contacts_SQLite
//
//  Created by Admin on 4/27/17.
//  Copyright © 2017 c4idiots. All rights reserved.
//

import Foundation
import SQLite

class ContactDataHelper{
    static let TABLE_NAME = "Contacts"
    
    static let contacts = Table(TABLE_NAME)
    
    static let contactId = Expression<Int64>("id")
    static let name = Expression<String>("name")
    static let address = Expression<String>("address")
    
    // MARK:- creating contact table
    static func createTable() {
        do{
            try DBManager.instance.db!.run(contacts.create(ifNotExists: true){ table in
                table.column(contactId, primaryKey: true)
                table.column(name)
                table.column(address)
            })
        } catch{
            print("Unable to creat table")
        }
    }
    
    // MARK:- insert entry into contact table
    static func insert(item: Contact) -> Int64 {
        do{
            let insert = contacts.insert(name <- item.name, address <- item.address)
            let id = try DBManager.instance.db!.run(insert)
            
            return id
        } catch{
            print("insert Failed")
            return -1
        }
    }
    
    // MARK:- delete entry from contact table
    static func delete(cID: Int64) -> Bool {
        do {
            let contact = contacts.filter(contactId == cID)
            try DBManager.instance.db!.run(contact.delete())
            return true
        } catch  {
            print("Delete failed")
        }
        return false
    }
    
    // MARK:- get all contacts with numbers
    static func getAll() -> [ContactPhone]? {
        var contacts:[ContactPhone] = []
        do{
            for contact in try DBManager.instance.db!.prepare(self.contacts) {
                let contactObj = Contact(id: contact[contactId], name: contact[name], address: contact[address])
                let phones = PhoneDataHelper.getPhones(by: contact[contactId])
                
                contacts.append(ContactPhone(contact: contactObj, phones: phones))
            }
        } catch{
            print("Selection failed")
        }
        return contacts
    }
    
    // MARK:- Drop the table
    static func dropTable() {
        do{
            try DBManager.instance.db?.run(contacts.drop())
            print("Droped Contact table")
        } catch{
            print("Could not drop Contact Table")
        }
    }
}

