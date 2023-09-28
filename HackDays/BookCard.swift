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
    @State private var navigateToDetails: Bool = false

    private var book: Book
    private var onRemove: (_ book: Book, _ isLiked: Bool) -> Void
    private var randomPrompt: Prompt
    
    private var thresholdPercentage: CGFloat = 0.4
    
    private enum LikeDislike: Int {
        case like, dislike, none
    }
    
    init(
        book: Book,
        onRemove: @escaping (_ book: Book, _ isLiked: Bool) -> Void
    ) {
        self.book = book
        self.onRemove = onRemove
        self.randomPrompt = book.prompts[book.featuredPromptIdx]
    }
    
    private func getGesturePercentage(_ geometry: GeometryProxy, from gesture: DragGesture.Value) -> CGFloat {
        gesture.translation.width / geometry.size.width
    }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {

                BookImage(book: book, geometry: geometry, percentage: 1.0)

                VStack {
                    Spacer()
                    
                    VStack(alignment: .leading, spacing: 6) {
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
                            Text(randomPrompt.answer)
                                .font(.subheadline)
                                .fixedSize(horizontal: false, vertical: true)
                        }
                        .padding(.vertical)
                    }
                    .padding()
                    .background(Color.white)
                }
                .background(LinearGradient(
                    gradient: Gradient(colors: [.clear, .clear, .clear, .black.opacity(0.2)]),
                    startPoint: .top, endPoint: .bottom))
            }
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
            .onTapGesture {
                navigateToDetails = true
            }
            .sheet(isPresented: $navigateToDetails) {
                BookDetailView(book: book)
            }
        }
    }
}
