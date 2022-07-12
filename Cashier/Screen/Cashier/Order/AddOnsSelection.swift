//
//  AddOnsSelection.swift
//  Cashier
//
//  Created by Swee Kwang Chua on 9/7/22.
//

import SwiftUI

struct AddOnsSelection: View {
    let foodName: String
    let price: Double
    @State var amount = 0
    var modifyAmount: (_ name: String, _ amount: Int, _ cost: Double) -> Void
    
    var body: some View {
        HStack {
            Text("\(amount) x")
            
            Text("\(foodName) \n$\(price)")
                .font(.body)
            Spacer()
            
            Stepper("", onIncrement: { increment() }, onDecrement: { decrement()})
        }
        .padding(.vertical)
    }
}

extension AddOnsSelection {
    func increment() {
        amount += 1
        modifyAmount(foodName, amount, price)
        
    }
    func decrement() {
        amount -= 1
        guard amount >= 0 else { return }
        modifyAmount(foodName, amount, price)
        
    }
}

struct AddOnsSelection_Previews: PreviewProvider {
    static var previews: some View {
        AddOnsSelection(foodName: "Cheese", price: 2, modifyAmount: {_, _, _ in })
            .padding()
    }
}
