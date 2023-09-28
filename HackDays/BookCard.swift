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
    private var onRemove: (_ book: Book, _ isLiked: Bool) -> Void
    private var randomPrompt: Prompt
    
    private var thresholdPercentage: CGFloat = 0.5
    
    private enum LikeDislike: Int {
        case like, dislike, none
    }
    
    init(book: Book, onRemove: @escaping (_ book: Book, _ isLiked: Bool) -> Void) {
        self.book = book
        self.onRemove = onRemove
        self.randomPrompt = book.prompts.randomElement()!
    }
    
    private func getGesturePercentage(_ geometry: GeometryProxy, from gesture: DragGesture.Value) -> CGFloat {
        gesture.translation.width / geometry.size.width
    }
    
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .leading) {
                
                AsyncImage(url: URL(string: book.imageURL))
                    .frame(width: geometry.size.width, height: geometry.size.height * 0.75)
                    .clipped()
                
                HStack {
                    VStack(alignment: .leading, spacing: 6) {
                        Text(book.title)
                            .font(.title)
                            .bold()
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
                        VStack(alignment: .leading, spacing: 10) {
                            Text(randomPrompt.question)
                                .font(.title3)
                            Text(randomPrompt.answer)
                                .font(.subheadline)
                            Spacer()
                        }
                        .padding(.top)
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
