//
//  ButtonView.swift
//  SlideQuest
//
//  Created by Дарья Кобелева on 29.04.2024.
//

import SwiftUI

struct ButtonView: View {
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button(title, action: action)
    }
}


struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(title: "Start", action: {})
    }
}
