//
//  BookViews.swift
//  HackDays
//
//  Created by Matt Muehlemann on 9/28/23.
//

import SwiftUI

struct BookImage: View {
    var book: Book
    var geometry: GeometryProxy
    var percentage: CGFloat
    var contentMode: ContentMode
    
    var body: some View {
        AsyncImage(
            url: URL(string: book.imageURL),
            content: { image in
                image.resizable()
                    .aspectRatio(contentMode: contentMode)
                    .frame(
                        maxWidth: geometry.size.width,
                        maxHeight: geometry.size.height * percentage
                    )
            },
            placeholder: {
                ProgressView()
            })
    }
}
