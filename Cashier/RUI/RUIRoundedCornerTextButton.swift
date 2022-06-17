//
//  RoundedCornerTextButton.swift
//  Warranty Expiry Alerts
//
//  Created by Swee Kwang Chua on 6/5/22.
//

import SwiftUI

struct RUIRoundedCornerTextButton: View {
    let text: String
    let backgroundColor: Color
    let textColor: Color
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            HStack {
                Spacer()
                Text(text)
                    .foregroundColor(textColor)
                Spacer()
            }
            .padding()
            .background(backgroundColor)
            .cornerRadius(8)
        }
    }
}

struct RUIRoundedCornerTextButton_Previews: PreviewProvider {
    static var previews: some View {
        RUIRoundedCornerTextButton(text: "Button Text", backgroundColor: .black, textColor: .white, action: {})
    }
}
