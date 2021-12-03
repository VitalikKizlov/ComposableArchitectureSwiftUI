//
//  Formatter.swift
//  ComposableArchitecture
//
//  Created by Vitalii Kizlov on 03.12.2021.
//

import Foundation

struct Formatter {
    static func ordinal(_ n: Int) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .ordinal
        return formatter.string(for: n) ?? ""
    }
}
