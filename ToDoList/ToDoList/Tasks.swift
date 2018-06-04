//
//  Tasks.swift
//  ToDoList
//
//  Created by Шынар Торехан on 01/07/2017.
//  Copyright © 2017 Kenes Inc. All rights reserved.
//

import Foundation

class Tasks {
    var name: String?
    var date: String?
    var image: String?
    
    init(name: String, date: String, image: String){
        self.name = name
        self.date = date
        self.image = image
    }
}
