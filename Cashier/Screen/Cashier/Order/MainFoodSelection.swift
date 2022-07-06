//
//  MainFoodSelection.swift
//  Cashier
//
//  Created by Swee Kwang Chua on 6/7/22.
//

import SwiftUI

struct MainFoodSelection: View {

    let foodName: String
    let price: Double
    @Binding var selection: String?
    
    var isSelected: Bool {
        foodName == selection
    }
    
    init(foodName: String, price: Double, selection: Binding<String?> = .constant(nil)){
        self.foodName = foodName
        self.price = price
        self._selection = selection
    }
    
    var body: some View {
        HStack {
            Circle()
                .strokeBorder(.gray, lineWidth: 2)
                .background(Circle().fill(isSelected ? .green : .clear))
                .frame(width: 20, height: 20, alignment: .center)
            
            Text(foodName)
                .font(.body)
            Spacer()
            
            Text("$\(String(format: "%.2f",price))")
                .font(.body)
        }
        .padding(.vertical)
    }
}

struct MainFoodSelection_Previews: PreviewProvider {
    static var previews: some View {
        MainFoodSelection(foodName: "Test", price: 2)
    }
}
