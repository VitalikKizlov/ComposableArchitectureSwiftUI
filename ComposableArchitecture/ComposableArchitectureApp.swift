//
//  ComposableArchitectureApp.swift
//  ComposableArchitecture
//
//  Created by Vitalii Kizlov on 03.12.2021.
//

import SwiftUI

@main
struct ComposableArchitectureApp: App {
    
    let store = Store(initialValue: AppState(), reducer: counterReducer)
    
    var body: some Scene {
        WindowGroup {
            ContentView(store: store)
        }
    }
}
