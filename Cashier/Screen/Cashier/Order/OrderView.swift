//
//  OrderView.swift
//  Cashier
//
//  Created by Swee Kwang Chua on 6/7/22.
//

import SwiftUI

struct OrderView: View {
    var main: [MainFood]
    var addOns: [AddOnItem]
    @State var selectedMains: String? = nil
    
    var body: some View {
        HStack {
            List{
                Section("Please Select One Item: ") {
                    ForEach(main, id: \.id) { main in
                        MainFoodSelection(foodName: main.itemName, price: main.price, selection: $selectedMains)
                            .onTapGesture {
                                selectedMains = main.itemName
                            }
                    }
                }
            }
            .listStyle(.plain)
        }
        
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView(main: [MainFood(id: "1", itemName: "Example Food 1", price: 2.2), MainFood(id: "2", itemName: "Example Food 2", price: 2.2)], addOns: [AddOnItem(id: "1", itemName: "Example Add On 1", price: 0.5), AddOnItem(id: "2", itemName: "Example Add On 2", price: 0.5), AddOnItem(id: "3", itemName: "Example Add On 3", price: 0.5)])
    }
}
