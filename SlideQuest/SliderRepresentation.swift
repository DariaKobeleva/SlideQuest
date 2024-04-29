//
//  SliderRepresentation.swift
//  SlideQuest
//
//  Created by Дарья Кобелева on 27.04.2024.
//

import SwiftUI

struct SliderRepresentation: UIViewRepresentable {
    @Binding var sliderValue: Float
    let action: () -> Void
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.value = sliderValue
        slider.thumbTintColor = .red
        
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.sliderValueChanged),
            for: .valueChanged
        )
        
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = sliderValue
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(sliderValue: $sliderValue, action: action)
    }
}

extension SliderRepresentation {
    final class Coordinator: NSObject {
        @Binding var sliderValue: Float
        let action: () -> Void
        
        init(sliderValue: Binding<Float>, action: @escaping () -> Void) {
            self._sliderValue = sliderValue
            self.action = action
        }
        
        @objc func sliderValueChanged(_ sender: UISlider) {
            sliderValue = sender.value
            print("Slider Value: \(sliderValue)") // Для отладки
            withAnimation {
                action()
            }
        }
    }
}

#Preview {
    SliderRepresentation(sliderValue: .constant(50)) {}
}

