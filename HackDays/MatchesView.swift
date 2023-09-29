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
        VStack(alignment: .leading) {
            
            let likedBooks = viewModel.getLikedBooks()
            
            // MATCHES COUNT
            HStack {
                Text("Your Matches")
                    .font(.title)
                
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
            .padding([.top, .horizontal])
            .foregroundColor(Color("BookBubRed"))
            
            Divider()
                .background(Color("LightGray"))
            
            ScrollView {
                ForEach(likedBooks, id: \.id) { book in
                    VStack(alignment: .leading) {
                        Link(destination: URL(string: book.bookbubURL)!) {
                            MatchView(book: book)
                                .frame(minHeight: 80)
                        }
                        .accentColor(.black)
                        
                        Divider()
                            .background(Color("LightGray"))
                    }
                }
            }
        }
    }
}
