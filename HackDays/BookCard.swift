//
//  BookCard.swift
//  HackDays
//
//  Created by Matt Muehlemann on 9/28/23.
//

import SwiftUI

struct BookCard: View {
    @State private var offset: CGSize = .zero
    @State private var translation: CGSize = .zero
    
    private var book: Book
    private var onClick: (_ book: Book) -> Void
    private var onRemove: (_ book: Book, _ isLiked: Bool) -> Void
    private var randomPrompt: Prompt
    
    private var thresholdPercentage: CGFloat = 0.4
    
    private enum LikeDislike: Int {
        case like, dislike, none
    }
    
    init(
        book: Book,
        onClick: @escaping (_ book: Book) -> Void,
        onRemove: @escaping (_ book: Book, _ isLiked: Bool) -> Void
    ) {
        self.book = book
        self.onClick = onClick
        self.onRemove = onRemove
        self.randomPrompt = book.prompts[book.featuredPromptIdx]
    }
    
    private func getGesturePercentage(_ geometry: GeometryProxy, from gesture: DragGesture.Value) -> CGFloat {
        gesture.translation.width / geometry.size.width
    }
    
    var body: some View {
        GeometryReader { geometry in
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
                
                HStack {
                    VStack(alignment: .leading, spacing: 6) {
                        Text(book.title)
                            .font(.title)
                            .bold()
                            .foregroundColor(.black)
                        Text(book.author)
                            .font(.subheadline)
                            .foregroundColor(.black)
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
                        VStack(alignment: .leading, spacing: 10) {
                            Text(randomPrompt.question)
                                .font(.title3)
                                .fixedSize(horizontal: false, vertical: true)
                                .foregroundColor(.black)
                            Text(randomPrompt.answer)
                                .font(.subheadline)
                                .fixedSize(horizontal: false, vertical: true)
                                .foregroundColor(.black)
                            Spacer()
                        }
                        .padding(.top)
                    }
                    .onTapGesture {
                        onClick(book)
                    }
                    
                    Spacer()
                }
                .padding(.horizontal)
            }
            .padding(.bottom)
            .background(Color.white)
            .cornerRadius(10)
            .shadow(radius: 5)
            .animation(.interactiveSpring(), value: offset)
            .offset(x: translation.width, y: 0)
            .rotationEffect(.degrees(Double(translation.width / geometry.size.width) * 25), anchor: .bottom)
            .gesture(
                DragGesture()
                    .onChanged { value in
                        translation = value.translation
                    }.onEnded { value in
                        let gestureDirection = getGesturePercentage(geometry, from: value)
                        if abs(gestureDirection) > thresholdPercentage {
                            onRemove(book, gestureDirection > 0)
                        } else {
                            translation = .zero
                        }
                    }
            )
        }
    }
}
