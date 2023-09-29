//
//  Book.swift
//  HackDays
//
//  Created by Matt Muehlemann on 9/28/23.
//

import Foundation


struct Book: Codable {
    var id: String
    var author: String
    var title: String
    var description: String
    var pageCount: String
    var category: String
    var imageURL: String
    var rating: Float
    var prompts: Array<Prompt>
    var featuredPromptIdx: Int
    var bookbubURL: String
}
