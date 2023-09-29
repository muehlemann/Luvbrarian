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
        let likedBooks = viewModel.getLikedBooks()
        if (likedBooks.count == 0) {
            VStack(alignment: .center) {
                Spacer()

                AsyncImage(
                    url: URL(string: "https://bookbub-res.cloudinary.com/image/upload/q_auto,f_auto,h_200//bookbub/image/not-enough.png"),
                    content: { image in
                        image.resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(
                                maxWidth: 200,
                                maxHeight: 200
                            )
                    },
                    placeholder: {
                        ProgressView()
                    })


                Text("You don't have any matches.\nSwipe on more books to make Bub happy!")
                    .font(.subheadline)
                    .fixedSize(horizontal: false, vertical: true)
                    .frame(maxWidth: 300)
                    .multilineTextAlignment(.center)
                
                Spacer()
            }
        } else {
        
            ScrollView {
                VStack(alignment: .leading) {
                    // MATCHES COUNT
                    HStack {
                        Text("Your Matches")
                        Circle().fill(.bookBubRed)
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
                    .foregroundColor(.bookBubRed)
                    
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
                                .background(Color.lightGray)
                        }

                    }
                }
            }
            .padding()
        }
    }
}
