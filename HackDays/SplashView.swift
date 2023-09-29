//
//  SplashView.swift
//  HackDays
//
//  Created by Dave Cohen on 9/28/23.
//

import SwiftUI

struct SplashView: View {
    
    @State var isActive: Bool = false
    
    var body: some View {
        ZStack {
            if self.isActive {
                ContentView()
            } else {
                Image("matchbook-splash")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                    .padding()
                    .background(Color("BookBubRed"))
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                withAnimation {
                    self.isActive = true
                }
            }
        }
    }
        
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
