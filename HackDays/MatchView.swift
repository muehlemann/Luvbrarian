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
                // COVER IMAGE
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
                    .shadow(radius: 5)
                    .padding(.leading, 10)

                
                VStack(alignment: .leading) {
                    // BOOK TITLE AND RATING
                    HStack {
                        Text(book.title)
                            .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                            .font(.headline)
                        
                        Spacer()
                        
                        let rating = String(format: "%.1f", Double(book.rating))
                        
                        Image(systemName: "star.fill")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .aspectRatio(contentMode: .fit)
                            .overlay {
                                Text(rating)
                                    .font(.caption2)
                                    .scaledToFit()
                                    .fontWeight(.semibold)
                                    .clipShape(ContainerRelativeShape())
                                    .foregroundColor(.black)
                            }
                            .foregroundColor(.yellow)
                    }
                    .padding(.bottom, 0)

                    // QUESTION
                    Text(book.prompts[book.featuredPromptIdx].question)
                        .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                        .font(.subheadline)
                    // ANSWER
                    Text(book.prompts[book.featuredPromptIdx].answer)
                        .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                        .font(.footnote)
                        .foregroundColor(.gray.opacity(0.8))

                }
                .padding(.leading, 20)
            }
            .frame(maxHeight: 100)
        }
    }
}
