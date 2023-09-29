//
//  NoMoreBooks.swift
//  HackDays
//
//  Created by Dave Cohen on 9/28/23.
//

import SwiftUI

struct NoMoreBooks: View {
    var body: some View {
        VStack(spacing: 24){
            Spacer()
            AsyncImage(
                url: URL(string: "https://bookbub-res.cloudinary.com/image/upload/q_auto,f_auto,h_200//bookbub/image/voracious.png"),
                content: { image in
                    image.resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(
                            maxWidth: 200,
                            maxHeight: 200
                        )
                },
                placeholder: {
                    ProgressView()
                })
                
            Text("You've swiped on all your potential matches today!")
                .font(.subheadline)
                .fixedSize(horizontal: false, vertical: true)
                .frame(maxWidth: 300)
                .multilineTextAlignment(.center)
            
            Link("Visit BookBub for more great books!",
                 destination: URL(string: "https://www.bookbub.com")!)
            .padding()
            .background(Color("BookBubRed"))
            .cornerRadius(10)
            .foregroundColor(Color.white)
            Spacer()
        }
        .padding()
        .background(Color.white)
        .frame(maxWidth: .infinity)
    }
}

struct NoMoreBooks_Previews: PreviewProvider {
    static var previews: some View {
        NoMoreBooks()
    }
}
