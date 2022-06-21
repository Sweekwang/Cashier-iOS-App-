//
//  TextTextField.swift
//  Cashier
//
//  Created by Swee Kwang Chua on 16/6/22.
//

import SwiftUI

struct TextTextField: View {
    let title: String
    let placeholder: String = ""
    let keyboardType: UIKeyboardType
    
    @Binding var text: String
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Text(title)
                Spacer()
            }
            .padding(.leading, 24)
            
            RUIFilledTextField(text: $text,
                               placeholder: placeholder,
                               keyboardType: keyboardType)
                .padding()
                .previewLayout(.sizeThatFits)
        }
    }
}

struct TextTextField_Previews: PreviewProvider {
    static var previews: some View {
        TextTextField(title: "Food Name", keyboardType: .default, text: .constant(""))
    }
}
