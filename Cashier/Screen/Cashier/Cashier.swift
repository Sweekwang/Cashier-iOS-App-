//
//  Cashier.swift
//  Cashier
//
//  Created by Swee Kwang Chua on 21/6/22.
//

import SwiftUI
import SwiftRUI

struct Cashier: View {
    @State var name = ""
    @State var cashPaid = ""
    @State var pickerSelection = 0
    @StateObject var cashierViewModel = CashierViewModel()
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Take Order")
                .font(.title)
                .bold()
                .padding()
            ScrollView {
                // MARK: - Customer Name
                
                TextTextField(title: "Name",
                              keyboardType: .default,
                              text: $name)
                
                TextTrailingButton(title: "Orders",
                                   action: {
                    cashierViewModel.showOrderView.toggle()
                })
                
                
                // MARK: - Payment Type
                VStack(alignment: .leading)  {
                    Text("Payment Type:")
                        .font(.title3)
                        .bold()
                    
                    Picker(selection: $pickerSelection, content: {
                        Text("Cash").tag(0)
                        Text("Grab Pay").tag(1)
                    }, label: {
                    })
                    .pickerStyle(.segmented)
                    .padding(.vertical)
                }
                .padding()
                
                // MARK: - Cash Paid by Customer
                if pickerSelection == 0 {
                    TextTextField(title: "Cash Given",
                                  keyboardType: .decimalPad,
                                  text: $name)
                    
                    
                    HStack{
                        Text("Change:")
                        Spacer()
                        Text("$0.00")
                    }
                    .padding()
                    .padding(.leading, 12)
                }
            }
            
            // MARK: - Change and Order
            HStack{
                
                VStack(alignment: .leading){
                    Text("Total Amount:")
                    Text("$0.00")
                }
                

                
                Spacer()
                
                RUIRoundedCornerTextButton(text: "Make Order",
                                           backgroundColor: .black,
                                           textColor: .white, action: {
                    
                })
                .padding(.leading)
                
                
            }
            .padding()
            .onAppear {
                cashierViewModel.getFood()
            }
            .sheet(isPresented: $cashierViewModel.showOrderView) {
                OrderView(main: cashierViewModel.main, addOns: cashierViewModel.addOns)
            }
        }
    }
}

struct Cashier_Previews: PreviewProvider {
    static var previews: some View {
        Cashier()
            .previewInterfaceOrientation(.portrait)
    }
}
