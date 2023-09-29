//
//  NavbarView.swift
//  HackDays
//
//  Created by Brandon on 9/28/23.
//

import SwiftUI

struct NavbarView: View {
    private var onPageClicked: (_ page: Page) -> Void
    
    @State var activePage: Page = .books
    
    init(onPageClicked: @escaping (_ page: Page) -> Void) {
        self.onPageClicked = onPageClicked
    }
        
    var body: some View {
                
        HStack(alignment: .center) {
            Spacer()
        
            Image("books")
                .resizable()
                .renderingMode(.template)
                .foregroundColor(activePage == .books ? Color("BookBubRed") : Color.gray)
                .frame(width: 50, height: 50)
                .onTapGesture {
                    print("Books Click")
                    activePage = .books
                    onPageClicked(.books)
                }
            
            Spacer()
            
            Image("matches")
                .resizable()
                .renderingMode(.template)
                .foregroundColor(activePage == .matches ? Color("BookBubRed") : Color.gray)
                .frame(width: 50, height: 50)
                .onTapGesture {
                    print("Matches Click")
                    activePage = .matches
                    onPageClicked(.matches)
                }
            
            Spacer()
        }
    }
}
