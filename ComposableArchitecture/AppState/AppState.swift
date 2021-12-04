//
//  AppState.swift
//  ComposableArchitecture
//
//  Created by Vitalii Kizlov on 03.12.2021.
//

import Foundation
import Combine
import CloudKit

func counterReducer(_ state: inout AppState, action: AppAction) {
    switch action {
    case .counter(.decrement):
        state.count -= 1
    case .counter(.increment):
        state.count += 1
    case .primeModal(.removeFavoritePrime):
        state.favoritePrimes.removeAll(where: { $0 == state.count })
        state.activityFeed.append(.init(timestamp: Date(), type: .removedFavoritePrime(state.count)))
    case .primeModal(.saveFavoritePrime):
        state.favoritePrimes.append(state.count)
        state.activityFeed.append(.init(timestamp: Date(), type: .addedFavoritePrime(state.count)))
    case .favoritePrime(.removeFavoritePrime(let indexSet)):
        for index in indexSet {
          let prime = state.favoritePrimes[index]
          state.favoritePrimes.remove(at: index)
          state.activityFeed.append(.init(timestamp: Date(), type: .removedFavoritePrime(prime)))
        }
    }
}

final class Store<Value, Action>: ObservableObject {
    @Published var value: Value
    private let reducer: (inout Value, Action) -> Void
    
    init(initialValue: Value, reducer: @escaping (inout Value, Action) -> Void) {
        self.value = initialValue
        self.reducer = reducer
    }
    
    func send(_ action: Action) {
        reducer(&value, action)
    }
}

struct AppState {
  var count = 0
  var favoritePrimes: [Int] = []
  var loggedInUser: User? = nil
  var activityFeed: [Activity] = []

  var favoritePrimesState: FavoritePrimesState {
    get {
      FavoritePrimesState(
        favoritePrimes: self.favoritePrimes,
        activityFeed: self.activityFeed
      )
    }
    set {
      self.favoritePrimes = newValue.favoritePrimes
      self.activityFeed = newValue.activityFeed
    }
  }
}
