//
//  PhoneDataHelper.swift
//  13_Contacts_SQLite
//
//  Created by Admin on 4/28/17.
//  Copyright © 2017 c4idiots. All rights reserved.
//

import Foundation
import SQLite

class PhoneDataHelper: DataBaseHelperProtocol{
    typealias T = Phone
    
    static let TABLE_NAME = "Phones"
    
    static let phones = Table(TABLE_NAME)
    static let phoneID = Expression<Int64>("id")
    static let userID = Expression<Int64>("userID")
    static let type = Expression<String>("type")
    static let number = Expression<String>("number")
    
    static func createTable() {
        do {
            try DBManager.instance.db!.run(phones.create(ifNotExists: true){table in
                table.column(phoneID, primaryKey: true)
                table.column(userID)
                table.column(type)
                table.column(number)
            })
        } catch {
            print("Unable to create table")
        }
    }
    
    static func insert(item: Phone) -> Int64 {
        do {
            let insert = phones.insert(userID <- item.userID, type <- item.type, number <- item.number)
            let id = try DBManager.instance.db!.run(insert)
            return id
        } catch {
            print("Insertion failed")
            return -1
        }
    }
    
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
    
    static func getAll() -> [Phone]? {
        var phoneData: [Phone] = []
        do {
            for phone in try DBManager.instance.db!.prepare(self.phones) {
                phoneData.append(Phone(id: phone[phoneID], userID: phone[userID], type: phone[type], number: phone[number]))
            }
        } catch {
            print("Failed getting data")
        }
        return phoneData
    }
    
    static func dropTable() {
        do{
            try DBManager.instance.db?.run(phones.drop())
        } catch{
            print("Could not drop Table")
        }
    }
}

