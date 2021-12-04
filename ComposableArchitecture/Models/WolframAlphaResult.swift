//
//  WolframAlphaResult.swift
//  ComposableArchitecture
//
//  Created by Vitalii Kizlov on 04.12.2021.
//

import Foundation

struct WolframAlphaResult: Decodable {
  let queryresult: QueryResult

  struct QueryResult: Decodable {
    let pods: [Pod]

    struct Pod: Decodable {
      let primary: Bool?
      let subpods: [SubPod]

      struct SubPod: Decodable {
        let plaintext: String
      }
    }
  }
}
