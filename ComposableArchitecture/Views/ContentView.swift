//
//  ContentView.swift
//  ComposableArchitecture
//
//  Created by Vitalii Kizlov on 03.12.2021.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var appState: AppState
    
    var body: some View {
        NavigationView {
            List {
                NavigationLink {
                    CounterView(count: $appState.count)
                } label: {
                    Text("Counter")
                }
                NavigationLink {
                    CounterView(count: $appState.count)
                } label: {
                    Text("Favorite primes")
                }
            }
            .navigationTitle(Text("State Management"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(appState: AppState())
    }
}
