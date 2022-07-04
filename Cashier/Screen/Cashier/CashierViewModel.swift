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
    
    @Published var showOrderView = false
    
    @Published var isLoadingMain = true
    @Published var isLoadingAddOns = true
    var main: [MainFood] = [MainFood]()
    var addOns: [AddOnItem] = [AddOnItem]()
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
