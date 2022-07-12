//
//  OrderViewModel.swift
//  Cashier
//
//  Created by Swee Kwang Chua on 9/7/22.
//

import Foundation

class OrderViewModel: ObservableObject {
    @Published var selectedMains: String? = nil
    @Published var mainCost: Double? = nil
    @Published var description: String = ""
    @Published var addOns: [String: [String: Double]] = [String: [String: Double]]()
    @Published var totalCost: Double = 0
    
    func addOrder() -> Food?{
        guard selectedMains != nil,
              mainCost != nil else {
            print("ERROR: Selected Mains or Mains Cost is Empty")
            return nil
        }
        return Food(name: selectedMains!, price: mainCost!, addOns: addOns, totalPrice: totalCost, description: description)
    }
    
    func updateCost(){
        var newCost = mainCost ?? 0
        for addOn in addOns.values {
            newCost = newCost + addOn["amount"]!
        }
        totalCost = newCost
    }
}

// MARK: - Add Ons Handler
extension OrderViewModel {
    func addAddOns(name: String, amount: Int, itemCost: Double) {
        if amount == 0 {
            addOns[name] = nil
        }
        addOns[name] = ["amount": Double(amount), "cost": Double(amount) * itemCost]
        updateCost()
    }
}
