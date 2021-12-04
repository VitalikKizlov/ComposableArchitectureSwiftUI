//
//  FavoritePrimesView.swift
//  ComposableArchitecture
//
//  Created by Vitalii Kizlov on 04.12.2021.
//

import SwiftUI

struct FavoritePrimesView: View {
  @Binding var state: FavoritePrimesState

  var body: some View {
    List {
      ForEach(self.state.favoritePrimes, id: \.self) { prime in
        Text("\(prime)")
      }
      .onDelete { indexSet in
        for index in indexSet {
          let prime = self.state.favoritePrimes[index]
          self.state.favoritePrimes.remove(at: index)
          self.state.activityFeed.append(.init(timestamp: Date(), type: .removedFavoritePrime(prime)))
        }
      }
    }
      .navigationBarTitle(Text("Favorite Primes"))
  }
}
