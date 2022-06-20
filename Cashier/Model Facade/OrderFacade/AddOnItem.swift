//
//  addon.swift
//  Cashier
//
//  Created by Swee Kwang Chua on 15/6/22.
//

import Foundation

struct AddOnItem: Identifiable {
    var id: String
    
    var itemName: String
    var price: Double
    
    static func createAddOn(from firestoreData: [String: Any], id: String) -> AddOnItem?{
        guard let name = firestoreData["name"] as? String,
              let price = firestoreData["price"] as? Double,
              let type = firestoreData["type"] as? String else {
            print("Error (AddOnItem): Failed to create main food from firestore data")
            return nil
        }
        
        guard type == FoodType.addOn.rawValue else {
            print("Error (AddOnItem): Invalid Foodtype. Food type should be main and not \(type)")
            return nil
        }
        
        return AddOnItem(id: id, itemName: name, price: price)
    }
}

struct MainFood: Identifiable {
    var id: String
    
    var itemName: String
    var price: Double
    
    static func createMainFood(from firestoreData: [String: Any], id: String) -> MainFood?{
        guard let name = firestoreData["name"] as? String,
              let price = firestoreData["price"] as? Double,
              let type = firestoreData["type"] as? String else {
            print("Error (MainFood): Failed to create main food from firestore data")
            return nil
        }
        
        guard type == FoodType.main.rawValue else {
            print("Error (MainFood): Invalid Foodtype. Food type should be main and not \(type)")
            return nil
        }
        
        return MainFood(id: id, itemName: name, price: price)
    }
}

