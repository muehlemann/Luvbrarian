//
//  Color+Extension.swift
//  HackDays
//
//  Created by Matt Muehlemann on 9/29/23.
//

import SwiftUI

extension Color {
    static var random: Color {
        return .init(hue: .random(in: 0...1), saturation: 1, brightness: 1, opacity: 1)
    }
}
