//
//  Contact.swift
//  TableView
//
//  Created by Zhanserik on 6/7/17.
//  Copyright © 2017 Kenes Inc. All rights reserved.
//

import Foundation

class Contact {
    var name: String?
    var phone: String?
    
    init() {}  // purpose??????????????
    init(name: String, phone: String) {
        self.name = name
        self.phone = phone
    }
    
    static func fetchContacts() -> [Contact] {    /// made function????
        return [
            Contact(name: "Johny", phone: "+123123123"),
            Contact(name: "Sara", phone: "+123123123"),
            Contact(name: "Helga", phone: "+123123123"),
            Contact(name: "Katy", phone: "+123123123"),
            Contact(name: "Trueman", phone: "+123123123"),
            Contact(name: "Jan", phone: "+123123123"),
            Contact(name: "Selvester", phone: "+123123123")
        ]
    }
}
