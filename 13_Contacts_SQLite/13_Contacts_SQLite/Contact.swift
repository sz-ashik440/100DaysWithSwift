//
//  Contacts.swift
//  13_Contacts_SQLite
//
//  Created by Admin on 4/27/17.
//  Copyright © 2017 c4idiots. All rights reserved.
//

import Foundation

struct Contact{
    var id: Int64 = 0
    var name: String
    var address: String
    
    init(name: String, address: String){
        self.name = name
        self.address = address
    }
    
    init(id: Int64, name: String, address: String) {
        self.id = id
        self.name = name
        self.address = address
    }
}

struct ContactPhone{
    var contact: Contact
    var phones: [Phone]
}
