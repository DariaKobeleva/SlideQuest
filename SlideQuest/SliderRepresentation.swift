//
//  SliderRepresentation.swift
//  SlideQuest
//
//  Created by Дарья Кобелева on 27.04.2024.
//

import SwiftUI

struct SliderRepresentation: UIViewRepresentable {
    @Binding var currentValue: Float
    
    let alpha: Double
    
    let action: () -> Void
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 100
        
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.sliderValueChanged),
            for: .valueChanged
        )
        
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
            uiView.value = currentValue
            uiView.thumbTintColor = UIColor.red.withAlphaComponent(alpha)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(sliderValue: $currentValue, action: action)
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
            withAnimation {
                action()
            }
        }
    }
}

#Preview {
    SliderRepresentation(currentValue: .constant(50), alpha: 1) {}
}

