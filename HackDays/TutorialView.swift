//
//  TutorialView.swift
//  HackDays
//
//  Created by Dave Cohen on 9/29/23.
//

import SwiftUI

struct TutorialView: View {
    @State private var offset: CGSize = .zero
    @State private var translation: CGSize = .zero
    @State private var swipeStatus: SwipeStatus = .none
    @State private var navigateToDetails: Bool = false
    
    private var thresholdPercentage: CGFloat = 0.4
    private var swipeStatusPercentage: CGFloat = 0.03
    
    private func getGesturePercentage(_ geometry: GeometryProxy, from gesture: DragGesture.Value) -> CGFloat {
        gesture.translation.width / geometry.size.width
    }
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                Text("Welcome to matchBook!")
                    .font(.headline)
                    .foregroundColor(Color.white)
                HStack {
                    Image("swipe-left")
                        .resizable()
                        .frame(width: 40, height: 40)
                    Spacer()
                    Text("Swipe right to match with books, or swipe left to move on to your next potential match")
                        .font(.subheadline)
                        .multilineTextAlignment(.center)
                        .fixedSize(horizontal: false, vertical: true)
                        .foregroundColor(Color.white)
                    Spacer()
                    Image("swipe-right")
                        .resizable()
                        .frame(width: 40, height: 40)
                }
                Spacer()
            }
            .padding()
            .background(Color("BookBubRed").opacity(0.9))
            .cornerRadius(10)
            .animation(.interactiveSpring(), value: offset)
            .offset(x: translation.width, y: 0)
            .rotationEffect(.degrees(Double(translation.width / geometry.size.width) * 25), anchor: .bottom)
            .gesture(
                DragGesture()
                    .onChanged { value in
                        translation = value.translation
                    }
                    .onEnded { value in
                        if abs(value.translation.width) > abs(value.translation.height) {
                            let gesturePercentage = getGesturePercentage(geometry, from: value)
                            if abs(gesturePercentage) > thresholdPercentage {
                                translation = CGSize(width: 20000.0, height: 0.0)
                            } else {
                                translation = .zero
                            }
                        } else {
                            translation = .zero
                        }
                    }
            )
            
        }
    }
}

struct TutorialView_Previews: PreviewProvider {
    static var previews: some View {
        TutorialView()
    }
}
