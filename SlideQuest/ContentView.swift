//
//  ContentView.swift
//  SlideQuest
//
//  Created by Дарья Кобелева on 27.04.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var sliderValue: Float = 0
    @State private var showAlert = false
    @State private var randomNumber = Int.random(in: 0...100)
    
    @State  private var score = 0
    
    var body: some View {
        VStack(spacing: 30) {
            Text("Подвиньте слайдер, как можно ближе к: \(randomNumber) ")
            
            SliderRepresentation(sliderValue: $sliderValue) {
                score = computeScore()
            }
            
            ButtonView(title: "Проверь меня!", action: { showAlert.toggle() })
                .alert("Your Score \(score)", isPresented: $showAlert , actions: {})
            
            ButtonView(title: "Начать заново") {
                sliderValue = 0
                randomNumber = Int.random(in: 0...100)
                score = 0
            }
        }
        .padding()
    }
    private func computeScore() -> Int {
        let sliderInt = lroundf(sliderValue)
        let difference = abs(randomNumber - sliderInt)
        return 100 - difference
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
