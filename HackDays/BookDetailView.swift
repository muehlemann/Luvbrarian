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
                    
                    BookImage(
                        book: book,
                        geometry: geometry,
                        percentage: 0.75, 
                        contentMode: .fill
                    )
                    
                    VStack(alignment: .leading, spacing: 6) {
                        // TITLE
                        VStack(alignment: .leading) {
                            Text(book.title)
                                .font(.title)
                                .bold()
                                .padding(.top)
                            
                            Text(book.author)
                                .font(.subheadline)
                        }.padding(.top)
                            
                        // METADATA
                        VStack {
                            HStack {
                                Image("rating")
                                    .resizable()
                                    .frame(width: 32.0, height: 32.0)
                                Text("\(book.review)")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                                Spacer()
                            }
                            HStack {
                                Image("pages")
                                    .resizable()
                                    .frame(width: 32.0, height: 32.0)
                                Text(book.pageCount)
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                                Spacer()
                            }
                            HStack {
                                Image("category")
                                    .resizable()
                                    .frame(width: 32.0, height: 32.0)
                                Text(book.category)
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                                Spacer()
                            }
                        }
                        .padding(.top)
                        
                        // 1ST PROMPT
                        if let firstPrompt = book.prompts.first {
                            PromptView(prompt: firstPrompt)
                        }
                        
                        // DESCRIPTION
                        VStack(alignment: .leading) {
                            Text("DESCRIPTION")
                                .font(.subheadline)
                                .bold()
                                .padding(EdgeInsets(top: 0, leading: 0, bottom: 4, trailing: 0))
                            
                            Text(book.description)
                                .font(.footnote)
                        }
                        .padding()
                        .background(.brown.opacity(0.15))
                        .cornerRadius(10)
                        .padding(.top)
                        
                        // OTHER PROMPTS
                        VStack(alignment: .leading) {
                            ForEach(book.prompts[1..<book.prompts.count], id: \.question) { prompt in
                                PromptView(prompt: prompt)
                            }
                        }
                    }
                    .padding(.horizontal)
                }
            }
            .padding(.bottom)
            .background(Color.white)
        }
    }
}

struct PromptView: View {
    
    var prompt: Prompt
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(prompt.question)
                .font(.title3)
                .fixedSize(horizontal: false, vertical: true)
            Text(prompt.answer)
                .font(.subheadline)
                .fixedSize(horizontal: false, vertical: true)
                .foregroundColor(.black.opacity(0.8))
                .italic()
            Spacer()
        }
        .padding(.top)
    }
}



