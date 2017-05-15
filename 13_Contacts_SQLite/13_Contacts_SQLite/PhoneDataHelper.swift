//
//  PhoneDataHelper.swift
//  13_Contacts_SQLite
//
//  Created by Admin on 4/28/17.
//  Copyright © 2017 c4idiots. All rights reserved.
//

import Foundation
import SQLite

class PhoneDataHelper{
    // Table name
    static let TABLE_NAME = "Phones"
    
    static let phones = Table(TABLE_NAME)
    
    // tables entries
    static let phoneID = Expression<Int64>("id")
    static let contactID = Expression<Int64>("contactID")
    static let type = Expression<String>("type")
    static let number = Expression<String>("number")
    
    // MARK:- creating the database
    static func createTable() {
        do {
            try DBManager.instance.db!.run(phones.create(ifNotExists: true){ table in
                table.column(phoneID, primaryKey: true)
                table.column(contactID)
                table.column(type)
                table.column(number)
            })
        } catch {
            print("Unable to create table")
        }
    }
    
    // MARK:- inserting entry into database
    static func insert(item: Phone) -> Int64 {
        do {
            let insert = phones.insert(contactID <- item.contactID, type <- item.type, number <- item.number)
            let id = try DBManager.instance.db!.run(insert)
            return id
        } catch {
            print("Insertion failed")
            return -1
        }
    }
    
    // MARK:- deleteing entry from database
    static func delete(cID: Int64) -> Bool {
        do {
            let phone = phones.filter(phoneID==cID)
            try DBManager.instance.db!.run(phone.delete())
            return true
        } catch {
            print("Delete failed")
        }
        return false
    }
    
    // MARK:- get phone numbers by contactID
    static func getPhones(by cID: Int64) -> [Phone] {
        var phoneData: [Phone] = []
        do{
            let query = phones.filter(self.contactID==cID)
            for phone in try DBManager.instance.db!.prepare(query) {
                phoneData.append(Phone(id: phone[phoneID], contactID: phone[contactID], type: phone[type], number: phone[number]))
            }
        } catch {
            print("Failed getting data")
        }
        return phoneData
    }
    
    // MARK:- get all phone numbers
    static func getAll() -> [Phone]? {
        var phoneData: [Phone] = []
        do {
            for phone in try DBManager.instance.db!.prepare(self.phones) {
                phoneData.append(Phone(id: phone[phoneID], contactID: phone[contactID], type: phone[type], number: phone[number]))
            }
        } catch {
            print("Failed getting data")
        }
        return phoneData
    }
    
    // MARK:- Drop the table
    static func dropTable() {
        do{
            try DBManager.instance.db?.run(phones.drop())
            print("Droped Phone table")
        } catch{
            print("Could not drop phone Table")
        }
    }
}

