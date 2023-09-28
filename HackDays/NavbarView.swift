//
//  NavbarView.swift
//  HackDays
//
//  Created by Brandon on 9/28/23.
//

import SwiftUI

struct NavbarView: View {
    private var onBookClick: (_ page: String) -> Void
    private var onMatchesClick: (_ page: String) -> Void

    init(
        onBookClick: @escaping (_ page: String) -> Void,
        onMatchesClick: @escaping (_ page: String) -> Void
    ) {
        self.onBookClick = onBookClick;
        self.onMatchesClick = onMatchesClick;
    }
    
    var body: some View {
        HStack(alignment: .center) {
            Spacer()
            
            Image("books")
                .resizable()
                .frame(width: 50, height: 50)
                .onTapGesture {
                    print("Books Click")
                    onBookClick("books")
                }
            
            Spacer()
            
            Image("matches")
                .resizable()
                .frame(width: 50, height: 50)
                .onTapGesture {
                    print("Matches Click")
                    onMatchesClick("matches")
                }
            
            Spacer()
        }
        .background(Color.white)
    }
}
