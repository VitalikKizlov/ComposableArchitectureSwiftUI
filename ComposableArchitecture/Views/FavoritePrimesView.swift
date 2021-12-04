//
//  FavoritePrimesView.swift
//  ComposableArchitecture
//
//  Created by Vitalii Kizlov on 04.12.2021.
//

import SwiftUI

struct FavoritePrimesView: View {
    @ObservedObject var store: Store<AppState, AppAction>
    
    var body: some View {
        List {
            ForEach(self.store.value.favoritePrimes, id: \.self) { prime in
                Text("\(prime)")
            }
            .onDelete { indexSet in
                self.store.send(.favoritePrime(.removeFavoritePrime(indexSet)))
            }
        }
        .navigationBarTitle(Text("Favorite Primes"))
    }
}
