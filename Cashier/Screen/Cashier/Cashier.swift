//
//  Cashier.swift
//  Cashier
//
//  Created by Swee Kwang Chua on 21/6/22.
//

import SwiftUI

struct Cashier: View {
    @State var name = ""
    @State var cashPaid = ""
    @State var pickerSelection = 0
    
    var body: some View {
        VStack {
            ScrollView {
                // MARK: - Customer Name
                
                TextTextField(title: "Name",
                              keyboardType: .default,
                              text: $name)
                
                TextTrailingButton(title: "Orders",
                                   action: {  })
                .padding()
                
                
                // MARK: - Payment Type
                VStack {
                    Text("Payment Type:")
                    
                    Picker(selection: $pickerSelection, content: {
                        Text("Cash").tag(0)
                        Text("Grab Pay").tag(1)
                    }, label: {
                    })
                    .pickerStyle(.segmented)
                }
                
                // MARK: - Cash Paid by Customer
                if pickerSelection == 0 {
                    TextTextField(title: "Cash Given",
                                  keyboardType: .decimalPad,
                                  text: $name)
                }
            }
            
            // MARK: - Change and Order
            HStack{
                VStack {
                    Text("Total Amount:")
                    Text("$0.00")
                }
            }
        }
    }
}

struct Cashier_Previews: PreviewProvider {
    static var previews: some View {
        Cashier()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
