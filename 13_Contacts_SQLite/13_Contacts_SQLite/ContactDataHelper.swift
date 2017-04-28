//
//  ContactDataHelper.swift
//  13_Contacts_SQLite
//
//  Created by Admin on 4/27/17.
//  Copyright © 2017 c4idiots. All rights reserved.
//

import Foundation
import SQLite

class ContactDataHelper: DataBaseHelperProtocol{
    typealias T = Contact
    
    static let TABLE_NAME = "Contacts"
    
    static let contacts = Table(TABLE_NAME)
    static let contactId = Expression<Int64>("id")
    static let name = Expression<String>("name")
    static let address = Expression<String>("address")
    
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
    
    static func getAll() -> [Contact]? {
        var contacts:[Contact] = []
        do{
            for contact in try DBManager.instance.db!.prepare(self.contacts) {
                contacts.append(Contact(id: contact[contactId], name: contact[name], address: contact[address]))
            }
        } catch{
            print("Selection failed")
        }
        return contacts
    }
    
    static func dropTable() {
        do{
            try DBManager.instance.db?.run(contacts.drop())
        } catch{
            print("Could not drop Table")
        }
    }
}

