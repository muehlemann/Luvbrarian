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
        HStack(alignment: .top) {
            // COVER IMAGE
            AsyncImage(
                url: URL(string: book.imageURL),
                content: { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 80, height: 120)
                        .shadow(radius: 5)

                },
                placeholder: {
                    ProgressView()
                }
            )
            .padding(.trailing)
            
            VStack(alignment: .leading) {
                // TITLE
                Text(book.title)
                    .font(.subheadline)
                    .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                
                // RAITING
                RatingView(rating: CGFloat(book.rating), maxRating: 5)

                // QUESTION
                Text(book.prompts[book.featuredPromptIdx].question)
                    .font(.subheadline)
                    .multilineTextAlignment(.leading)
                
                // ANSWER
                Text(book.prompts[book.featuredPromptIdx].answer)
                    .font(.footnote)
                    .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.gray.opacity(0.8))

            }
        }
        .padding()
    }
}
