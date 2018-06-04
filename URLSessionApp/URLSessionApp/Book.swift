//
//  Book.swift
//  URLSessionApp
//
//  Created by Galym Kulyn on 20.06.2017.
//  Copyright © 2017 galymco. All rights reserved.
//

import Foundation

class Book {
    var title: String?
    var authors: [String]?
    var smallThumbnail: String?
    var thumbnail: String?
    var publisher: String?
    var releaseDate: String?
    var bookDescription: String?
    
    init(title: String?, authors: [String]?, thumbnail: String?, smallThumbnail: String?, publisher: String?, releaseDate: String?, bookDescription: String?) {
        self.title = title
        self.authors = authors
        self.smallThumbnail = smallThumbnail
        self.thumbnail = thumbnail
        self.publisher = publisher
        self.releaseDate = releaseDate
        self.bookDescription = bookDescription
    }
}
