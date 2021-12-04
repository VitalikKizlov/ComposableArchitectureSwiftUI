//
//  ComposableArchitectureApp.swift
//  ComposableArchitecture
//
//  Created by Vitalii Kizlov on 03.12.2021.
//

import SwiftUI

@main
struct ComposableArchitectureApp: App {
    
    let state = AppState()
    
    var body: some Scene {
        WindowGroup {
            ContentView(state: state)
        }
    }
}
