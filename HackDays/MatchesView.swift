//
//  MatchesView.swift
//  HackDays
//
//  Created by Brandon on 9/28/23.
//

import SwiftUI

struct MatchesView: View {
    @ObservedObject var viewModel = BookViewModel()
    var body: some View {
        VStack(alignment: .leading) {
            ForEach(viewModel.getLikedBooks(), id: \.id) { book in
                Group {
                    MatchView(book: book)
                }
            }
        }
    }
}
