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
    
    let randomNumber = Int.random(in: 0...100)
    var body: some View {
        VStack(spacing: 30) {
            Text("Подвиньте слайдер, как можно ближе к: \(randomNumber) ")
            
            SliderRepresentation(sliderValue: $sliderValue)
           // Slider(value: $sliderValue, in: 0...255, step: 1)
            
            ButtonView(title: "Проверь меня!", action: {})
                .alert("Your Score", isPresented: $showAlert , actions: {})
            ButtonView(title: "Начать заново", action: {})
        }
        .padding()
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
