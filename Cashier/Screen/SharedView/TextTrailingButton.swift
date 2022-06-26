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
        ZStack {
            Color(red: 245/255, green: 245/255, blue: 245/255, opacity: 1)
            HStack {
                Text(title.capitalized)
                    .font(.subheadline)
                    .fontWeight(.medium)
                    .textCase(nil)
                
                Spacer()
                
                Button(action: { action() },
                       label: { Image(systemName: "plus.circle").font(.title3) })
            }
            .padding(12)
        }
        .padding()
        .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
        .frame(height: 60, alignment: .center)
        .cornerRadius(12)
        .background(.white)
    }
}

struct TextTrailingButton_Previews: PreviewProvider {
    static var previews: some View {
        TextTrailingButton(title: "Main", action: {})
            
            .previewLayout(.sizeThatFits)
    }
}
