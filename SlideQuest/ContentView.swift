//
//  ContentView.swift
//  SlideQuest
//
//  Created by Дарья Кобелева on 27.04.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var targetValue = Int.random(in: 0...100)
    @State private var currentValue: Float = 50
    @State  private var score = 0
    @State private var alpha: CGFloat = 0.5
    @State private var showAlert = false
    
    var body: some View {
        VStack(spacing: 30) {
            Text("Move the slider as close as possible to: \(targetValue) ")
            
            HStack {
                Text("0")
                SliderRepresentation(currentValue: $currentValue, alpha: $alpha) {
                    changeThumbAlpha()
                }
                Text("100")
            }
            
            ButtonView(title: "Check me!") {
                showAlert.toggle()
            }
            .alert("Your Score", isPresented: $showAlert , actions: {}) {
                Text("\(score)")
            }
            .onAppear {
                changeThumbAlpha()
            }
            
            ButtonView(title: "Go again") {
                currentValue = 50
                targetValue = Int.random(in: 0...100)
                score = 0
                changeThumbAlpha()
            }
        }
        .padding()
    }
    
    private func computeScore() -> Int {
        let sliderInt = lroundf(currentValue)
        let difference = abs(targetValue - sliderInt)
        return 100 - difference
    }
    
    private func changeThumbAlpha() {
        score = computeScore()
        alpha = CGFloat(score) / 100
    }
}

#Preview {
    ContentView()
}

