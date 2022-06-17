//
//  FoodSettingViewModel.swift
//  Cashier
//
//  Created by Swee Kwang Chua on 17/6/22.
//

import Foundation
import FirebaseFirestore

struct FoodSettingViewModel {
    
}

// MARK: - Add Main
extension FoodSettingViewModel {
    func addMains(name: String, price: String) {
        var ref: DocumentReference? = nil
        
        ref = FirestoreReference("Menu")
            .addDocument(data: [
                "name": name,
                "price": Double(price)!,
                "type": "mains"
            ]) { error in
                if let err = error {
                    print("Error Adding Mains (FoodSettingViewModel): \(err)")
                } else {
                    print("Document added with ID: \(ref!.documentID)")
                }
            }
    }
}
