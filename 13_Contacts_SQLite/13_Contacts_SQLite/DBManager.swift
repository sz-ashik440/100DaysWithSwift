//
//  DBManager.swift
//  13_Contacts_SQLite
//
//  Created by Admin on 4/27/17.
//  Copyright © 2017 c4idiots. All rights reserved.
//

import Foundation
import SQLite

enum DataAccessError: Error{
    case Datastore_Connection_Error
    case Insert_Error
    case Delete_Error
    case Search_Error
    case Nil_In_Data
}

class DBManager{
    static let instance = DBManager()
    let db: Connection?
    
    private init() {
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        do{
            db = try Connection("\(path)/PhoneBook.sqlite3")
        } catch {
            db = nil
            print("Unable to open database")
        }
    }
    
    func createTable(){
        ContactDataHelper.createTable()
        PhoneDataHelper.createTable()
    }
    
    func dropTable() {
        ContactDataHelper.dropTable()
        PhoneDataHelper.dropTable()
    }
}
