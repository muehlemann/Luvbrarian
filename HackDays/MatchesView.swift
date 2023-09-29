//
//  MatchesView.swift
//  HackDays
//
//  Created by Brandon on 9/28/23.
//

import SwiftUI

struct MatchesView: View {
    @ObservedObject var viewModel = BookViewModel()
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                let likedBooks = viewModel.getLikedBooks()
                
                // MATCHES COUNT
                HStack {
                    Text("Your Matches")
                    
                    Circle().fill(Color("BookBubRed"))
                        .frame(width: 20, height: 20)
                        .overlay {
                            Text("\(likedBooks.count)")
                                .font(.caption)
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                .clipShape(ContainerRelativeShape())
                                .foregroundColor(.white)
                        }
                    
                }
                .padding([.leading, .bottom], 10)
                .fontWeight(.medium)
                .foregroundColor(Color("BookBubRed"))
                
                Spacer()
                
                ForEach(likedBooks, id: \.id) { book in
                    Group {
                        Link(destination: URL(string: book.bookbubURL)!) {
                            MatchView(book: book)
                                .frame(minHeight: 80)
                        }
                        .accentColor(.black)
                        .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                        
                        Divider()
                            .frame(height: 1)
                            .background(Color("LightGray"))
                    }
                }
            }
        }
        .padding()
    }
}
