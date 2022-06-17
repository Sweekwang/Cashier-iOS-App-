//
//  AddFood.swift
//  Cashier
//
//  Created by Swee Kwang Chua on 16/6/22.
//

import SwiftUI

struct AddFood: View {
    @Environment(\.presentationMode) var presentationMode
    var title: String
    var action: () -> Void
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    TextTextField(title: "Name", text: .constant(""))
                    
                    TextTextField(title: "Price", text: .constant(""))
                }
                
                RUIRoundedCornerTextButton(text: "Add", backgroundColor: .black, textColor: .white, action: {
                    action()
                    presentationMode.wrappedValue.dismiss()
                })
                    .padding()
            }
            .padding(.top, 24)
            
            .navigationTitle(title)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "chevron.backward")
                    }
                }
                
            }
        } //: NavigationView
    }
}

struct AddFood_Previews: PreviewProvider {
    static var previews: some View {
        AddFood(title: "Add Mains", action: { })
    }
}
