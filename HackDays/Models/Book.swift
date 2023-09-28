//
//  Book.swift
//  HackDays
//
//  Created by Matt Muehlemann on 9/28/23.
//

import Foundation


struct Book {
    var id: String
    var author: String
    var title: String
    var pageCount: String
    var category: String
    var imageURL: String
    var prompts: Array<Prompt>
}
