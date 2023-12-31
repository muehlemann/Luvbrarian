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
                    
                    VStack {
                        BookImage(
                            book: book,
                            geometry: geometry,
                            percentage: 0.75,
                            contentMode: .fill
                        )
                    }
                    .frame(width: geometry.size.width)
                    .background(Color.gray.opacity(0.5))
                    
                    VStack(alignment: .leading, spacing: 6) {
                        // TITLE
                        VStack(alignment: .leading) {
                            Text(book.title)
                                .font(.title)
                                .foregroundColor(.black)
                                .bold()
                                .padding(.top)
                            
                            Text(book.author)
                                .font(.subheadline)
                                .foregroundColor(.black)
                        }.padding(.top)
                            
                        // METADATA
                        VStack {
                            HStack {
                                Image("rating")
                                    .resizable()
                                    .frame(width: 32.0, height: 32.0)
                                
                                RatingView(rating: CGFloat(book.rating), maxRating: 5)
                                Spacer()
                            }
                            HStack {
                                Image("pages")
                                    .resizable()
                                    .frame(width: 32.0, height: 32.0)
                                Text(book.pageCount)
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                                    .frame(height: 22)
                                Spacer()
                            }
                            HStack {
                                Image("category")
                                    .resizable()
                                    .frame(width: 32.0, height: 32.0)
                                Text(book.category)
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                                    .frame(height: 22)
                                Spacer()
                            }
                        }
                        .padding(.top)
                        
                        // 1ST PROMPT
                        if let firstPrompt = book.prompts[safe: 0] {
                            PromptView(prompt: firstPrompt)
                        }
                        
                        // DESCRIPTION
                        if !book.description.isEmpty {
                            DescriptionView(description: book.description)
                        }
                        
                        // 2ND PROMPT
                        if let secondPrompt = book.prompts[safe: 1] {
                            PromptView(prompt: secondPrompt)
                        }
                        
                        // EMOJI VIEW
                        DefinedEmojiView()
                        
                        // 3ED PROMPT
                        if let thirdPrompt = book.prompts[safe: 2] {
                            PromptView(prompt: thirdPrompt)
                        }
                        
                        // REVIEW
                        ReviewView(review: book.review)
                        
                        // VIEW ON BB CTA
                        if let bookbubURL = URL(string: book.bookbubURL) {
                            VStack() {
                                Link("View on BookBub", destination: bookbubURL)
                                    .padding()
                                    .background(Color("BookBubRed"))
                                    .foregroundColor(Color.white)
                                    .cornerRadius(10)
                            }
                            .frame(maxWidth: geometry.size.width)
                            .padding(.vertical, 50)
                        }
                        
                    }
                    .padding(.horizontal)
                }
                .padding(.bottom, 50)
            }
            .background(Color.white)
            .edgesIgnoringSafeArea(.vertical)
        }
    }
}

struct DescriptionView: View {
    var description: String
    
    @State var isExpanded = false

    var body: some View {
        VStack(alignment: .leading) {
            Text("What my parents say about me...")
                .font(.subheadline)
                .bold()
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 4, trailing: 0))
            
            Text(description)
                .animation(.easeOut(duration: 1), value: false)
                .font(.footnote)
                .foregroundColor(.black)
                .lineLimit(isExpanded ? nil : 5)
                .truncationMode(.tail)
            

            Text("Read \(isExpanded ? "less" : "more")").onTapGesture {
                withAnimation(Animation.spring().speed(1.5)) {
                    isExpanded.toggle()
                }
            }
            .font(.footnote)
            .foregroundColor(.black)
            .underline()
            .padding(.top, 2)
        }
        .padding()
        .background(Color.indigo.opacity(0.15))
        .cornerRadius(10)
        .padding(.top)
    }
}

struct DefinedEmojiView: View {
    
    var body: some View {
        HStack(alignment: .center) {
            let books = ["📕", "📗", "📘", "📙", "📖", "📚", "📓", "📒", "📔", "✍️"]
            Text(books.randomElement() ?? "✍️")
                .font(.system(size: 50))
                .bold()
                .padding(12)
                .background(.green.opacity(0.6))
                .clipShape(Circle())
            
            Text("This emoji defines me!")
                .font(.subheadline)
                .bold()
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 4, trailing: 0))
            
            Spacer()
        }
        .padding()
        .background(Color.green.opacity(0.15))
        .cornerRadius(10)
        .padding(.top)
    }
}

struct ReviewView: View {
    var review: Review
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("What my friends say about me...")
                .font(.subheadline)
                .bold()
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 4, trailing: 0))
            
            Text(review.text)
                .font(.footnote)
                .foregroundColor(.black)
            
            HStack {
                let faces = ["☺️", "😆", "🤪", "👹", "🎃", "🤡", "💀", "😈"]
                Text(faces.randomElement() ?? "🫥")
                    .font(.footnote)
                    .bold()
                    .padding(6)
                    .background(.brown.opacity(0.8))
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)

                VStack(alignment: .leading) {
                    Text("\(review.reviewer.name), \(review.reviewer.age)")
                        .font(.caption)
                        .bold()
                        .foregroundColor(.black)
                    
                    Text(review.reviewer.profession)
                        .font(.caption)
                        .italic()
                        .foregroundColor(.black)
                }
            }
            .padding(.top, 2)
        }
        .padding()
        .background(Color.orange.opacity(0.15))
        .cornerRadius(10)
        .padding(.top)
    }
}

struct PromptView: View {
    var prompt: Prompt
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: "questionmark.circle")
                    .resizable()
                    .frame(width: 18, height: 18)
                    .aspectRatio(contentMode: .fit)
                    .padding(9)
                    .background(
                        Circle().foregroundColor(Color.brown.opacity(0.2))
                    )
                
                Text(prompt.question.uppercased())
                    .font(.subheadline)
                    .foregroundColor(.black)
                    .bold()
                    .fixedSize(horizontal: false, vertical: true)
            }
            
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

struct RatingView: View {
    var rating: CGFloat
    var maxRating: Int
    
    @State var isStarView = true

    var body: some View {
        ZStack {
            if (isStarView) {
                let stars =  HStack(spacing: 4) {
                    ForEach(0..<maxRating, id: \.self) { _ in
                        Image(systemName: "star.fill")
                            .resizable()
                            .frame(width: 18, height: 18)
                            .aspectRatio(contentMode: .fit)
                    }
                }
                
                stars.overlay(
                    GeometryReader { g in
                        let width = rating / CGFloat(maxRating) * g.size.width
                        ZStack(alignment: .leading) {
                            Rectangle()
                                .frame(width: width)
                                .foregroundColor(.yellow)
                        }
                    }
                        .mask(stars)
                )
                .foregroundColor(.gray)
                .frame(height: 22)
            } else {
                let formattedRating = String(format: "%.1f", Double(rating))
                let formattedMaximun = String(format: "%.1f", Double(maxRating))
                HStack(spacing: 4) {
                    Text("\(formattedRating)/\(formattedMaximun)")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .frame(height: 22)
                }
            }
        }
        .onTapGesture {
            isStarView.toggle()
        }
    }
}



