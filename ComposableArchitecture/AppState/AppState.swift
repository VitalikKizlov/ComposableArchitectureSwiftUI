//
//  AppState.swift
//  ComposableArchitecture
//
//  Created by Vitalii Kizlov on 03.12.2021.
//

import Foundation
import Combine

final class AppState: ObservableObject {
    @Published var count = 0
}
