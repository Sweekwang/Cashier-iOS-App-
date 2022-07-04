//
//  AddFood.swift
//  Cashier
//
//  Created by Swee Kwang Chua on 16/6/22.
//

import SwiftUI
import SwiftRUI

struct AddFood: View {
    @Environment(\.presentationMode) var presentationMode
    @State var name = ""
    @State var price = ""
    var documentId: String? = nil
    
    var title: String
    var action: (_ name: String, _ price: String) -> Void
    
    init(title: String,
         action: @escaping (_ name: String, _ price: String) -> Void,
         name: String?,
         price: Double?,
         documentId: String?) {
        self.title = title
        self.action = action
        self._name = State(initialValue: name ?? "")
        self._price = State(initialValue: price != nil ? String(price!) : "")
        self.documentId = documentId
    }
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    TextTextField(title: "Name",
                                  keyboardType: .default,
                                  text: $name)
                    
                    TextTextField(title: "Price",
                                  keyboardType: .decimalPad,
                                  text: $price)
                }
                
                RUIRoundedCornerTextButton(text: documentId == nil ? "Add" : "Modify",
                                           backgroundColor: .black,
                                           textColor: .white, action: {
                    action(name, price)
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
        AddFood(title: "Add Mains",
                action: { _, _ in },
                name: nil, price: nil, documentId: nil)
    }
}
