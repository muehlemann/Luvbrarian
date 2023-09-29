//
//  Collections+Extension.swift
//  HackDays
//
//  Created by Matt Muehlemann on 9/29/23.
//

import Foundation

extension Collection {
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
