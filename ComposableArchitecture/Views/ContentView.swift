//
//  ContentView.swift
//  ComposableArchitecture
//
//  Created by Vitalii Kizlov on 03.12.2021.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var store: Store<AppState, AppAction>
    
    var body: some View {
        NavigationView {
          List {
            NavigationLink(destination: CounterView(store: self.store)) {
              Text("Counter demo")
            }
              NavigationLink(destination: FavoritePrimesView(store: self.store)) {
              Text("Favorite primes")
            }
          }
          .navigationBarTitle("State management")
        }
      }
}
