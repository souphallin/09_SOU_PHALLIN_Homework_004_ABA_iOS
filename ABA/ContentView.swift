//
//  ContentView.swift
//  ABA
//
//  Created by Mac on 6/9/25.
//

import SwiftUI

let backgroundGradient = LinearGradient(
    colors: [Color.red, Color.blue],
    startPoint: .top, endPoint: .bottom)


struct ContentView: View {
    @State private var name: String = ""
    var body: some View {
        ZStack {
            backgroundGradient
                .ignoresSafeArea()
            VStack {
                Text("Welcome")
                    .font(.title)
                HStack {
                    TextField("Your name?", text: $name)
                        .textFieldStyle(.roundedBorder)
                    Button(action: {}, label: {
                        Image(systemName: "arrow.right.square")
                            .font(.title)
                    })
                }
                .padding()
            }
        }
    }
}
#Preview {
    ContentView()
}
