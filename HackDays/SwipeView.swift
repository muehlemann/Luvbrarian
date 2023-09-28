//
//  SwipeView.swift
//  HackDays
//
//  Created by Matt Muehlemann on 9/28/23.
//

import SwiftUI

struct SwipeView: View {
    @ObservedObject var viewModel = BookViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                GeometryReader { geometry in
                    VStack(spacing: 24) {
                        ZStack {
                            NoMoreBooks()
                            ForEach(viewModel.books, id: \.id) { book in
                                Group {
                                    BookCard(
                                        book: book,
                                        onRemove: { book, isLiked in
                                            viewModel.markBook(book: book, isLiked: isLiked)
                                            print("Swiped on \(book.title). Liked: \(isLiked)")
                                        })
                                }
                            }
                        }
                    }
                    Spacer()
                }
            }
            .padding()
        }
    }
}
