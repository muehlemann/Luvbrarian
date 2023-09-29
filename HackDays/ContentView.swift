//
//  ContentView.swift
//  HackDays
//
//  Created by Matt Muehlemann on 9/28/23.
//

import SwiftUI

struct ContentView: View {
    @State private var page = Page.books

    private enum Page: Int {
        case matches, books, none
    }

    var body: some View {
        if (page == .matches) {
            VStack {
                MatchesView()
                NavbarView(
                    onBookClick: { Page in page = .books},
                    onMatchesClick: { Page in page = .matches}
                )
            }
        } else {
            VStack {
                SwipeView()
                NavbarView(
                    onBookClick: { Page in page = .books},
                    onMatchesClick: { Page in page = .matches}
                )
            }
        }
        

    }
}
