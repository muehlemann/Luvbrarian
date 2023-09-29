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
            Text("We don't have any more potential matches for you today")
                .font(.subheadline)
                .fixedSize(horizontal: false, vertical: true)
                .frame(maxWidth: 300)
                .multilineTextAlignment(.center)
            Link("Visit BookBub for more great books!",
                 destination: URL(string: "https://www.bookbub.com")!)
            .padding()
            .background(Color.bookBubRed)
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
