//
//  CashierViewModel.swift
//  Cashier
//
//  Created by Swee Kwang Chua on 4/7/22.
//

import SwiftUI


class CashierViewModel: ObservableObject {
    @Published var name = ""
    @Published var cashPaid = ""
    @Published var pickerSelection = 0
    @Published var orders = [Food]()
    
    @Published var showOrderView = false
    
    @Published var isLoadingMain = true
    @Published var isLoadingAddOns = true
    var main: [MainFood] = [MainFood]()
    var addOns: [AddOnItem] = [AddOnItem]()
    
    var totalCost: Double {
        orders.reduce(0) { partialResult, food in
            return partialResult + food.totalPrice
        }
    }
    
    var changes: Double {
        guard let cash = Double(cashPaid) else { return 0 }
        
        return Double(cash) - totalCost
    }
    
    func addFood(order: Food) {
        orders.append(order)
        objectWillChange.send()
    }
}


// MARK: - Get Data
extension CashierViewModel {
    func getFood() {
        self.getMain()
        self.getAddons()
    }
    
    func getMain() {
        FirestoreReference("Menu")
            .whereField("type", isEqualTo: "main")
            .getDocuments { [self] querySnapshot, err in
                if let err = err {
                    print("Error getting documents (CashierViewModel):\(err)")
                } else {
                    for document in querySnapshot!.documents {
                        let mainFood = MainFood.createMainFood(from: document.data(), id: document.documentID)
                        main.append(mainFood!)
                    }
                    isLoadingMain = false
                }
            }
    }
    
    func getAddons() {
        FirestoreReference("Menu")
            .whereField("type", isEqualTo: "addOn")
            .getDocuments { [self] querySnapshot, err in
                if let err = err {
                    print("Error getting documents (CashierViewModel):\(err)")
                } else {
                    for document in querySnapshot!.documents {
                        let addOn = AddOnItem.createAddOn(from: document.data(), id: document.documentID)
                        addOns.append(addOn!)
                    }
                    isLoadingAddOns = false
                }
                print(addOns)
            }
    }
}

// MARK: - Cashier
extension CashierViewModel {
    func sendOrder() {
        defer { clearOrder() }
        
        guard name != "",
              orders.count > 0 else { return }
        
        if pickerSelection == 0 && cashPaid == "" {
            return
        }
        
        
        
        // TODO: Add to DB
        
        
    }
    
    private func clearOrder() {
        name = ""
        cashPaid = ""
        pickerSelection = 0
        orders = [Food]()
    }
}
