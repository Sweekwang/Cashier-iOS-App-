//
//  FoodDetails.swift
//  Cashier
//
//  Created by Swee Kwang Chua on 19/6/22.
//

import SwiftUI

struct FoodDetails: View {
    let name: String
    let price: Double
    
    var body: some View {
        HStack {
            Text(name)
            
            Spacer()
            
            Text("$\(String(format: "%.2f", price))")
        }
        .padding()
    }
}

struct FoodDetails_Previews: PreviewProvider {
    static var previews: some View {
        FoodDetails(name: "Hammydinger Bagel Sandwich", price: 2.99)
    }
}
