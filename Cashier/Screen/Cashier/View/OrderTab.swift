//
//  OrderTab.swift
//  Cashier
//
//  Created by Swee Kwang Chua on 12/7/22.
//

import SwiftUI
import SwiftRUI

struct OrderTab: View {
    let food: Food
    let btnText: String
    let actionButton: () -> Void
    
    var keys: [String] {
        Array(food.addOns.keys)
    }
    
    var body: some View {
        VStack(alignment: .leading){
            HStack {
                Text(food.name)
                    .bold()
                    .font(.title2)
                Spacer()
                
                Text("$\(String(format: "%.2f", food.price))")
                    .font(.title2)
            }
            .padding(.bottom, 8)
            
            
            ForEach(keys, id: \.self) { name in
                Text("\(String(format:"%.2f",food.addOns[name]!["amount"] ?? 999)) x cheese")
            }.padding(.bottom, 8)
   
            if food.description != nil{
                Text(food.description!)
 
            }
            
            RUIRoundedCornerTextButton(text: "Delete Order", backgroundColor: .red, textColor: .black) {
                
            }
            .padding()
            
        }
        .padding(16)
        .background(Color(uiColor: UIColor.systemGray6))
        .cornerRadius(8)
        .padding()
    }
}

struct OrderTab_Previews: PreviewProvider {
    static var previews: some View {
        OrderTab(food: Food(name: "Food", price: 2.0, addOns: ["Cheese": ["amount": 2, "cost": 1]], totalPrice: 3.0),
    btnText: "Delete Order", actionButton: { })
            .previewLayout(.sizeThatFits)
    }
}
