//
//  CounterActions.swift
//  ComposableArchitecture
//
//  Created by Vitalii Kizlov on 04.12.2021.
//

import Foundation

enum AppAction {
    case counter(CounterAction)
    case primeModal(PrimeModalAction)
    case favoritePrime(FavoritePrimesAction)
}

enum CounterAction {
    case decrement
    case increment
}

enum PrimeModalAction {
    case saveFavoritePrime
    case removeFavoritePrime
}

enum FavoritePrimesAction {
    case removeFavoritePrime(IndexSet)
}
