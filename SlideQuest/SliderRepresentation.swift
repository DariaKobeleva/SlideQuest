//
//  SliderRepresentation.swift
//  SlideQuest
//
//  Created by Дарья Кобелева on 27.04.2024.
//

import SwiftUI

struct SliderRepresentation: UIViewRepresentable {
    @Binding var sliderValue: Float
    
    func makeUIView(context: Context) -> UISlider {
       let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.value = sliderValue
        slider.thumbTintColor = .red
        
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = sliderValue
    }
}

#Preview {
    SliderRepresentation(sliderValue: .constant(50))
}
