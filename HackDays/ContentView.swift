//
//  ContentView.swift
//  HackDays
//
//  Created by Matt Muehlemann on 9/28/23.
//

import SwiftUI

struct ContentView: View {
    @State var books: [Book] = [
        Book(
            id: "0",
            author: "Daniel James Brown",
            title: "The Boys in the Boat",
            description: "desc",
            imageURL: "https://res.cloudinary.com/bookbub/image/upload/t_ci_ar_6:9_padded,f_auto,q_auto,dpr_1/v1693102977/pro_pbid_14701.jpg"),
        Book(
            id: "1",
            author: "Claire Allan",
            title: "Her Name Was Rose",
            description: "desc",
            imageURL: "https://res.cloudinary.com/bookbub/image/upload/t_ci_ar_6:9_padded,f_auto,q_auto,dpr_1/v1530135523/pro_pbid_4038603.jpg"),
        Book(
            id: "2",
            author: "David McCullough",
            title: "The Wright Brothers",
            description: "desc",
            imageURL: "https://res.cloudinary.com/bookbub/image/upload/t_ci_ar_6:9_padded,f_auto,q_auto,dpr_1/v1695653003/pro_pbid_256866.jpg"),
        Book(
            id: "3",
            author: "Mieko Kawakami",
            title: "Heaven",
            description: "desc",
            imageURL: "https://res.cloudinary.com/bookbub/image/upload/t_ci_ar_6:9_padded,f_auto,q_auto,dpr_2,c_scale,w_405/v1695225900/pro_pbid_5089618.jpg"),
    ]
    
    
    @State private var offset: CGSize = CGSize.zero
    
    var body: some View {
        VStack {
            GeometryReader { geometry in
                VStack(spacing: 24) {
                    ZStack {
                        ForEach(self.books, id: \.id) { book in
                            Group {
                                BookCard(book: book, onRemove: { book, isLiked in
                                    self.books.removeAll { $0.id == book.id }
                                    print("Swiped on \(book.title). Liked: \(isLiked)")
                                })
                            }
                        }
                    }
                }
                Spacer()
            }
        }.padding()
    }
}
