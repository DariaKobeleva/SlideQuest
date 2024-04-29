//
//  ContentView.swift
//  SlideQuest
//
//  Created by Дарья Кобелева on 27.04.2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var targetValue = Int.random(in: 0...100)
    @State private var currentValue: Float = 100
    @State  private var score = 0
    @State private var alpha: CGFloat = 1
    @State private var showAlert = false

    var body: some View {
        VStack(spacing: 30) {
            Text("Move the slider as close as possible to: \(targetValue) ")
            
            SliderRepresentation(currentValue: $currentValue, alpha: $alpha) {
                changeThumbAlpha()
            }
            
            ButtonView(title: "Check me!") {
                showAlert.toggle()
            }
            .alert("Your Score", isPresented: $showAlert , actions: {}) {
                Text("\(score)")
            }
            
            ButtonView(title: "Go again") {
                currentValue = 0
                targetValue = Int.random(in: 0...100)
                score = 0
                changeThumbAlpha()
            }
        }
        .padding()
        .onAppear {
            changeThumbAlpha()
        }
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

struct ButtonView: View {
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button(title, action: action)
    }
    
}
