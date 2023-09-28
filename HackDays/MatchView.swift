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
            HStack {
                AsyncImage(
                    url: URL(string: book.imageURL),
                    content: { image in
                        image.resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(
                                maxWidth: 64,
                                maxHeight: 64
                            )
                    },
                    placeholder: {
                        ProgressView()
                    })
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    .padding(.leading, 10)
                
                VStack(alignment: .leading) {
                    Text(book.title)
                        .font(.title3)
                    
                    Text(book.prompts[book.featuredPromptIdx].question)
                }
                .padding(.leading, 20)

//                .frame(minWidth: geometry.size.width * 0.6)
//                Spacer()
            }
        } 
    }
}
