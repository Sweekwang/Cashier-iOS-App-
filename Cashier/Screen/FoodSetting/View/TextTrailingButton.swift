//
//  TextTrailingButton.swift
//  Cashier
//
//  Created by Swee Kwang Chua on 16/6/22.
//

import SwiftUI

struct TextTrailingButton: View {
    let title: String
    let action: () -> Void
    
    var body: some View {
        HStack {
            Text(title.capitalized)
                .font(.title3)
                .fontWeight(.medium)
                .textCase(nil)
            
            Spacer()
            
            Button(action: { action() },
                   label: { Image(systemName: "plus.circle").font(.title3) })
        }
    }
}

struct TextTrailingButton_Previews: PreviewProvider {
    static var previews: some View {
        TextTrailingButton(title: "Main", action: {})
    }
}
