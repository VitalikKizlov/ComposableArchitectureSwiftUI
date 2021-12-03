//
//  CounterView.swift
//  ComposableArchitecture
//
//  Created by Vitalii Kizlov on 03.12.2021.
//

import Foundation
import SwiftUI

struct CounterView: View {
    @Binding var count: Int
    
    var body: some View {
        VStack {
            HStack {
                Button {
                    self.count -= 1
                } label: {
                    Text("-")
                }
                Text("\(self.count)")
                Button {
                    self.count += 1
                } label: {
                    Text("+")
                }
            }
            Button {
                print("fsdfsd")
            } label: {
                Text("Is this prime ?")
            }
            Button {
                print("fsdfsd")
            } label: {
                Text("What is the \(Formatter.ordinal(self.count)) prime ?")
            }
        }
        .navigationTitle("Counter Demo")
        .font(.title)
    }
}
