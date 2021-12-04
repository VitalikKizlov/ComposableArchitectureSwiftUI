//
//  User.swift
//  ComposableArchitecture
//
//  Created by Vitalii Kizlov on 04.12.2021.
//

import Foundation

struct Activity {
    let timestamp: Date
    let type: ActivityType
    
    enum ActivityType {
        case addedFavoritePrime(Int)
        case removedFavoritePrime(Int)
    }
}

struct User {
    let id: Int
    let name: String
    let bio: String
}

struct PrimeAlert: Identifiable {
    let prime: Int
    
    var id: Int { self.prime }
}

struct FavoritePrimesState {
    var favoritePrimes: [Int]
    var activityFeed: [Activity]
}
