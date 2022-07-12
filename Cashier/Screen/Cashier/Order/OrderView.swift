//
//  OrderView.swift
//  Cashier
//
//  Created by Swee Kwang Chua on 6/7/22.
//

import SwiftUI
import SwiftRUI

struct OrderView: View {
    @Environment(\.presentationMode) var presentationMode
    var main: [MainFood]
    var addOns: [AddOnItem]
    var sendorder: (Food) -> Void
    @ObservedObject var orderVM = OrderViewModel()
    
    var body: some View {
        NavigationView {
            ZStack{
                List{
                    Section("Please Select One Item: ") {
                        ForEach(main, id: \.id) { main in
                            MainFoodSelection(foodName: main.itemName, price: main.price, selection: $orderVM.selectedMains)
                                .onTapGesture {
                                    orderVM.selectedMains = main.itemName
                                    orderVM.mainCost = main.price
                                    orderVM.updateCost()
                                }
                        }
                    }
                    
                    Section("Add ons: ") {
                        ForEach(addOns, id: \.id) { addon in
                            AddOnsSelection(foodName: addon.itemName, price: addon.price, modifyAmount: { name, amount, cost in
                       orderVM.addAddOns(name: name, amount: amount, itemCost: cost)
                            })
                        }
                    }
                    
                    VStack(alignment: .leading) {
                        Text("Description")
                        TextEditor(text: $orderVM.description)
                            .padding(8)
                            .overlay(
                                RoundedRectangle(cornerRadius: 2)
                                    .strokeBorder(.gray)
                            )
                            .frame(minHeight: 300, maxHeight: 1000)
                        
                    }
                    
                }
                .listStyle(.plain)
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button {
                            presentationMode.wrappedValue.dismiss()
                        } label: {
                            Image(systemName: "chevron.backward")
                        }
                    }
                }
                
                // MARK: - MAKE ORDER
                VStack {
                    Spacer()
                    HStack{
                        VStack(alignment: .leading){
                            Text("Total Amount:")
                            Text("$\(orderVM.totalCost)")
                        }
                        
                        Spacer()
                        
                        RUIRoundedCornerTextButton(text: "Add Order",
                                                   backgroundColor: .black,
                                                   textColor: .white, action: {
                            let food = orderVM.addOrder()
                            if let food = food {
                                sendorder(food)
                                presentationMode.wrappedValue.dismiss()
                                
                            }
                        })
                        .padding(.leading)
                        
                    }
                    .padding(.top)
                    .background(.white)
                }
            }
            .padding()
        }
        .onTapGesture(count: 2) {
            UIApplication.shared.endEditing()
        }
        
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView(main: [MainFood(id: "1", itemName: "Example Food 1", price: 2.2), MainFood(id: "2", itemName: "Example Food 2", price: 2.2)], addOns: [AddOnItem(id: "1", itemName: "Example Add On 1", price: 0.5), AddOnItem(id: "2", itemName: "Example Add On 2", price: 0.5), AddOnItem(id: "3", itemName: "Example Add On 3", price: 0.5)], sendorder: {_ in})
    }
}

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
