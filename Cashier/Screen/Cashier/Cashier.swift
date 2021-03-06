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
                
                TextTextField(title: "Phone Number",
                              keyboardType: .default,
                              text: $name)
                
                TextTrailingButton(title: "Orders",
                                   action: {
                    cashierViewModel.showOrderView.toggle()
                })

                ForEach(cashierViewModel.orders) { food in
                    OrderTab(food: food, btnText: "Delete Order", actionButton: {})
                }
                
                
                // MARK: - Payment Type
                VStack(alignment: .leading)  {
                    Text("Payment Type:")
                        .font(.title3)
                        .bold()
                    
                    Picker(selection: $pickerSelection, content: {
                        Text("Cash").tag(0)
                        Text("Grab Pay").tag(1)
                        Text("PayLah Pay").tag(1)
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
                                  text: $cashierViewModel.cashPaid)
                    
                    
                    HStack{
                        Text("Change:")
                        Spacer()
                        Text("$\(String(format: "%.2f", cashierViewModel.changes))")
                    }
                    .padding()
                    .padding(.leading, 12)
                }
            }
            
            // MARK: - Change and Order
            HStack{
                
                VStack(alignment: .leading){
                    Text("Total Amount:")
                    Text("$\(String(format: "%.2f", cashierViewModel.totalCost))")
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
                OrderView(main: cashierViewModel.main, addOns: cashierViewModel.addOns, sendorder: { food in
                    print("called")
                    cashierViewModel.addFood(order: food)
                })
            }
        }.onTapGesture(count: 2) {
            UIApplication.shared.endEditing()
        }
    }
}

struct Cashier_Previews: PreviewProvider {
    static var previews: some View {
        Cashier()
            .previewInterfaceOrientation(.portrait)
    }
}
