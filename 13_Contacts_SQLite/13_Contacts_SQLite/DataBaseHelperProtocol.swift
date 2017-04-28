//
//  DataBaseHelperProtocol.swift
//  13_Contacts_SQLite
//
//  Created by Admin on 4/27/17.
//  Copyright © 2017 c4idiots. All rights reserved.
//

import Foundation

protocol DataBaseHelperProtocol{
    associatedtype T
    static func createTable() -> Void
    static func insert(item: T) -> Int64
    static func delete(cID: Int64) -> Bool
    static func getAll() -> [T]?
    static func dropTable() -> Void
}
