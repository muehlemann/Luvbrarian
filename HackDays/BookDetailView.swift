//
//  BookDetailView.swift
//  HackDays
//
//  Created by Matt Muehlemann on 9/28/23.
//

import SwiftUI

struct BookDetailView: View {
    @ObservedObject var viewModel = BookViewModel()

    var book: Book

    init(book: Book) {
        self.book = book
    }
    
    var body: some View {
        GeometryReader { geometry in

            ScrollView {
                VStack(alignment: .leading) {
                    AsyncImage(
                        url: URL(string: book.imageURL),
                        content: { image in
                            image.resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(maxWidth: geometry.size.width, maxHeight: geometry.size.height * 0.75)
                        },
                        placeholder: {
                            ProgressView()
                        })
                    
                    VStack(alignment: .leading) {
                        
                        
                        HStack {
                            VStack(alignment: .leading, spacing: 6) {
                                Text(book.title)
                                    .font(.title)
                                    .bold()
                                    .padding(.top)
                                Text(book.author)
                                    .font(.subheadline)
                                HStack {
                                    Image("pages")
                                        .resizable()
                                        .frame(width: 32.0, height: 32.0)
                                    Text(book.pageCount)
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                    Image("category")
                                        .resizable()
                                        .frame(width: 32.0, height: 32.0)
                                    Text(book.category)
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                    Spacer()
                                }
                                .padding(.vertical)
                            }
                        }
                        
                        
                        VStack(alignment: .leading, spacing: 10) {
                            ForEach(book.prompts, id: \.question) { prompt in
                                Text(prompt.question)
                                    .font(.title3)
                                    .fixedSize(horizontal: false, vertical: true)
                                Text(prompt.answer)
                                    .font(.subheadline)
                                    .fixedSize(horizontal: false, vertical: true)
                                Spacer()
                            }
                        }
                    }.padding(.horizontal)
                }
            }
            .padding(.bottom)
            .background(Color.white)
        }
    }
}



