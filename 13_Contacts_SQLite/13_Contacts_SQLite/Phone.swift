//
//  Phone.swift
//  13_Contacts_SQLite
//
//  Created by Admin on 4/28/17.
//  Copyright © 2017 c4idiots. All rights reserved.
//

import Foundation


struct Phone{
    var id: Int64
    var contactID: Int64
    var type: String
    var number: String
    
    init(contactID: Int64, type: String, number: String) {
        self.id = 0
        self.contactID = contactID
        self.type = type
        self.number = number
    }
    
    init(id: Int64, contactID: Int64, type: String, number: String) {
        self.id = id
        self.contactID = contactID
        self.type = type
        self.number = number
    }
}
