//
//  RUIFilledTextField.swift
//  Warranty Expiry Alerts
//
//  Created by Swee Kwang Chua on 28/5/22.
//

import SwiftUI

struct RUIFilledTextField: View {
    @Binding var text: String
    var placeholder: String
    
    // MARK: - Types
    var isSecure: Bool
    
    // MARK: - Text
    var textColor: Color = .black
    var topPlaceHolderFont: Font = .body
    
    // MARK: - Border
    var borderColor: Color = .init(uiColor: UIColor.systemGray4)
    
    // MARK: - Shadows Properties
    var shadowColor: Color = .init(uiColor: UIColor.systemGray3)
    @State var shadowRadius: CGFloat = 0
    @State var shadowY: CGFloat = 0
    
    // MARK: - Init
    init(text: Binding<String>,
         placeholder: String = "",
         textColor: Color = .black,
         topPlaceHolderFont: Font = .body,
         isSecure: Bool = false) {
        self._text = text
        self.placeholder = placeholder
        self.textColor = textColor
        self.topPlaceHolderFont = topPlaceHolderFont
        self.isSecure = isSecure
    }
    
    var body: some View {
        HStack {
            if isSecure {
                SecureField(placeholder, text: $text)
                    .font(topPlaceHolderFont)
                    .padding(20)
                    .background(.white)
                    .foregroundColor(textColor)
            } else {
                TextField(placeholder, text: $text)
                    .font(topPlaceHolderFont)
                    .padding(20)
                    .background(.white)
                    .foregroundColor(textColor)
            }
        }
        .cornerRadius(8)
        .shadow(color: shadowColor, radius: shadowRadius, x: 0, y: shadowY)
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(borderColor, lineWidth: 1)
        )
        
        
        
        
    }
}

struct RUIFilledTextField_Previews: PreviewProvider {
    static var previews: some View {
        RUIFilledTextField(text: .constant(""), placeholder: "Username")
            .padding()
            .previewLayout(.sizeThatFits)
    }
}
