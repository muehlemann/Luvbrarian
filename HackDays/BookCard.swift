//
//  BookCard.swift
//  HackDays
//
//  Created by Matt Muehlemann on 9/28/23.
//

import SwiftUI

public enum SwipeStatus {
    case like, dislike, none
}

struct BookCard: View {
    @State private var offset: CGSize = .zero
    @State private var translation: CGSize = .zero
    @State private var swipeStatus: SwipeStatus = .none
    @State private var navigateToDetails: Bool = false

    private var book: Book
    private var isFirst: Bool
    private var onRemove: (_ book: Book, _ isLiked: Bool) -> Void
    private var randomPrompt: Prompt
    
    private var thresholdPercentage: CGFloat = 0.4
    private var swipeStatusPercentage: CGFloat = 0.03

    init(
        book: Book,
        isFirst: Bool,
        onRemove: @escaping (_ book: Book, _ isLiked: Bool) -> Void
    ) {
        self.book = book
        self.isFirst = isFirst
        self.onRemove = onRemove
        self.randomPrompt = book.prompts[book.featuredPromptIdx]
    }
    
    private func getGesturePercentage(_ geometry: GeometryProxy, from gesture: DragGesture.Value) -> CGFloat {
        gesture.translation.width / geometry.size.width
    }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {

                VStack {
                    BookImage(
                        book: book,
                        geometry: geometry,
                        percentage: 0.8,
                        contentMode: .fit
                    )
                 
                    Spacer()
                }
                .frame(width: geometry.size.width, height: geometry.size.height)
                .background(Color.gray.opacity(0.5))

                VStack {
                    SwipeStatusView(swipeStatus: swipeStatus)
                    
                    Spacer()
                    
                    VStack(alignment: .leading, spacing: 6) {
                        HStack {
                            Image("category")
                                .resizable()
                                .frame(width: 32.0, height: 32.0)
                            Text(book.category)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                            Spacer()
                            Image("pages")
                                .resizable()
                                .frame(width: 32.0, height: 32.0)
                            Text(book.pageCount)
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
                        }
                        .padding(.vertical)
                    }
                    .padding()
                    .background(Color.white)
                }
                .background(LinearGradient(
                    gradient: Gradient(colors: [.clear, .clear, .black]),
                    startPoint: .top, endPoint: .bottom))
            }
            .background(Color.white)
            .cornerRadius(10)
            .shadow(radius: isFirst ? 5 : 0)
            .animation(.interactiveSpring(), value: offset)
            .offset(x: translation.width, y: 0)
            .rotationEffect(.degrees(Double(translation.width / geometry.size.width) * 25), anchor: .bottom)
            .gesture(
                DragGesture()
                    .onChanged { value in
                        translation = value.translation
                                                
                        let gesturePercentage = getGesturePercentage(geometry, from: value)
                        withAnimation(Animation.spring()) {
                            if (gesturePercentage >= swipeStatusPercentage) {
                                swipeStatus = .like
                            } else if (gesturePercentage <= -swipeStatusPercentage) {
                                swipeStatus = .dislike
                            } else {
                                swipeStatus = .none
                            }
                        }
                        
                    }.onEnded { value in
                        if abs(value.translation.width) > abs(value.translation.height) {
                            let gesturePercentage = getGesturePercentage(geometry, from: value)
                            if abs(gesturePercentage) > thresholdPercentage {
                                onRemove(book, gesturePercentage > 0)
                            } else {
                                translation = .zero
                            }
                        } else {
                            navigateToDetails = true
                            
                            translation = .zero
                        }
                        
                        swipeStatus = .none
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

struct SwipeStatusView: View {
    var swipeStatus: SwipeStatus
    
    init(swipeStatus: SwipeStatus) {
        self.swipeStatus = swipeStatus
    }
    
    var body: some View {
        HStack {
            switch (swipeStatus) {
            case .like:
                Image(systemName: "heart.circle")
                    .resizable()
                    .frame(width: 60.0, height: 60.0)
                    .foregroundColor(Color.green)
                    .rotationEffect(Angle.degrees(-15))
                    .shadow(color: .black, radius: 10)
                    .padding(20)

                Spacer()
            case .dislike:
                Spacer()
                
                Image(systemName: "xmark.circle")
                    .resizable()
                    .frame(width: 60.0, height: 60.0)
                    .foregroundColor(Color("BookBubRed"))
                    .rotationEffect(Angle.degrees(15))
                    .shadow(color: .black, radius: 10)
                    .padding(20)

            default:
                EmptyView()
            }
        }
    }
}
