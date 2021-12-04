//
//  CounterView.swift
//  ComposableArchitecture
//
//  Created by Vitalii Kizlov on 03.12.2021.
//

import Foundation
import SwiftUI

struct CounterView: View {
    @ObservedObject var state: AppState
    @State var isPrimeModalShown: Bool = false
    @State var alertNthPrime: PrimeAlert?
    @State var isNthPrimeButtonDisabled = false
    
    var body: some View {
        VStack {
            HStack {
                Button(action: { self.state.count -= 1 }) {
                    Text("-")
                }
                Text("\(self.state.count)")
                Button(action: { self.state.count += 1 }) {
                    Text("+")
                }
            }
            Button(action: { self.isPrimeModalShown = true }) {
                Text("Is this prime?")
            }
            Button(action: self.nthPrimeButtonAction) {
                Text("What is the \(Formatter.ordinal(self.state.count)) prime?")
            }
            .disabled(self.isNthPrimeButtonDisabled)
        }
        .font(.title)
        .navigationBarTitle("Counter demo")
        .sheet(isPresented: self.$isPrimeModalShown) {
            IsPrimeModalView(state: self.state)
        }
        .alert(item: self.$alertNthPrime) { alert in
            Alert(
                title: Text("The \(Formatter.ordinal(self.state.count)) prime is \(alert.prime)"),
                dismissButton: .default(Text("Ok"))
            )
        }
    }
    
    func nthPrimeButtonAction() {
        self.isNthPrimeButtonDisabled = true
        nthPrime(self.state.count) { prime in
            self.alertNthPrime = prime.map(PrimeAlert.init(prime:))
            self.isNthPrimeButtonDisabled = false
        }
    }
    
    func nthPrime(_ n: Int, callback: @escaping (Int?) -> Void) -> Void {
        wolframAlpha(query: "prime \(n)") { result in
            callback(
                result
                    .flatMap {
                        $0.queryresult
                            .pods
                            .first(where: { $0.primary == .some(true) })?
                            .subpods
                            .first?
                            .plaintext
                    }
                    .flatMap(Int.init)
            )
        }
    }
    
    func wolframAlpha(query: String, callback: @escaping (WolframAlphaResult?) -> Void) -> Void {
        let pod = WolframAlphaResult.QueryResult.Pod(primary: true, subpods: [])
        let queryResult = WolframAlphaResult.QueryResult(pods: [pod])
        let result = WolframAlphaResult(queryresult: queryResult)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            callback(result)
        }
    }
}
