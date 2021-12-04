//
//  ContentView.swift
//  ComposableArchitecture
//
//  Created by Vitalii Kizlov on 03.12.2021.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var store: Store<AppState, CounterAction>
    
    var body: some View {
        NavigationView {
          List {
            NavigationLink(destination: CounterView(store: self.store)) {
              Text("Counter demo")
            }
              NavigationLink(destination: FavoritePrimesView(state: self.$store.value.favoritePrimesState)) {
              Text("Favorite primes")
            }
          }
          .navigationBarTitle("State management")
        }
      }
}
