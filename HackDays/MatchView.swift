//
//  MatchView.swift
//  HackDays
//
//  Created by Brandon on 9/28/23.
//

import SwiftUI

struct MatchView: View {
    @State private var navigateToDetails: Bool = false
    private var book: Book
    
    init(
        book: Book
    ) {
        self.book = book
    }

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                HStack {
//                    BookImage(book: book, geometry: geometry, percentage: 0.01)
//                        .padding(.leading)
                    Text("image")
                        .padding([.leading])
                    Spacer()
                }
                HStack {
                    VStack(alignment: .leading) {
                        Text(book.title)
                            .font(.title3)
                        
                        Text(book.prompts[book.featuredPromptIdx].question)
                    }
                }
            }
        } 
    }
}
