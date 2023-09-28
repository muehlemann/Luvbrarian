//
//  BookDetailView.swift
//  HackDays
//
//  Created by Matt Muehlemann on 9/28/23.
//

import SwiftUI

struct BookDetailView: View {
    
    var book: Book? = nil

    init(book: Book) {
        self.book = book
    }
    
    var body: some View {
        Text("Detail View For Book Id: \(book?.id ?? "")")
    }
}



