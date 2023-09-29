//
//  ContentView.swift
//  HackDays
//
//  Created by Matt Muehlemann on 9/28/23.
//

import SwiftUI

enum Page: Int {
    case matches, books, none
}

struct ContentView: View {
    @State private var page = Page.books

    var body: some View {
        VStack {
            if (page == .matches) {
                MatchesView()
            } else {
                SwipeView()
            }
            
            NavbarView(onPageClicked: { newPage in page = newPage })
        }
    }
}
