//
//  SwipeView.swift
//  HackDays
//
//  Created by Matt Muehlemann on 9/28/23.
//

import SwiftUI

struct SwipeView: View {
    @ObservedObject var viewModel = BookViewModel()

    
    @State private var navigateToDetails: Bool = false

    
    var body: some View {
        
        NavigationView {
            
            VStack {
                GeometryReader { geometry in
                    VStack(spacing: 24) {
                        ZStack {
                            ForEach(viewModel.books, id: \.id) { book in
                                Group {
                                    BookCard(
                                        book: book,
                                        onClick: { book in
                                            navigateToDetails = true
                                        },
                                        onRemove: { book, isLiked in
                                            viewModel.markBook(book: book, isLiked: isLiked)
                                            print("Swiped on \(book.title). Liked: \(isLiked)")
                                        })
                                    .sheet(isPresented: $navigateToDetails) {
                                        BookDetailView(book: book)
                                    }
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
