//
//  FoodSettingViewModel.swift
//  Cashier
//
//  Created by Swee Kwang Chua on 17/6/22.
//

import Foundation
import FirebaseFirestore

enum FoodType: String {
    case main = "main"
    case addOn = "addOn"
}

class FoodSettingViewModel: ObservableObject {
    @Published var mainFoods = [MainFood]()
    @Published var addOns = [AddOnItem]()
    
    var name: String? = nil
    var price: Double? = nil
    var documentId: String? = nil
    
}

// MARK: - Firebase
extension FoodSettingViewModel {
    // MARK: Create
    func addFood(name: String, price: String, type: FoodType) {
        var ref: DocumentReference? = nil
        
        ref = FirestoreReference("Menu")
            .addDocument(data: [
                "name": name,
                "price": Double(price)!,
                "type": type.rawValue
            ]) { error in
                if let err = error {
                    print("Error Adding Mains (FoodSettingViewModel): \(err)")
                } else {
                    switch type {
                    case .main:
                        self.mainFoods.append(MainFood(id: ref!.documentID, itemName: name, price: Double(price)!))
                        return
                    case .addOn:
                        self.addOns.append(AddOnItem(id: ref!.documentID, itemName: name, price: Double(price)!))
                        return
                    }
                }
            }
    }
    
    // MARK: Read
    func readMain() {
        FirestoreReference("Menu")
            .whereField("type", isEqualTo: FoodType.main.rawValue)
            .getDocuments { querySnapshot, err in
                if let err = err {
                    // TODO: - Handle Error
                    print("Error getting documents: \(err)")
                } else {
                    
                    self.mainFoods = querySnapshot!.documents.map { document -> MainFood in
                        let data = document.data()
                        return MainFood.createMainFood(from: data, id: document.documentID)!
                    }
                    
                    print(self.mainFoods)
                    
                    
                }
            }
    }
    
    func readAddOns() {
        FirestoreReference("Menu")
            .whereField("type", isEqualTo: FoodType.addOn.rawValue)
            .getDocuments { querySnapshot, err in
                if let err = err {
                    // TODO: - Handle Error
                    print("Error getting documents: \(err)")
                } else {
                    
                    self.addOns = querySnapshot!.documents.map { document -> AddOnItem in
                        let data = document.data()
                        return AddOnItem.createAddOn(from: data, id: document.documentID)!
                    }
                    
                    print(self.mainFoods)
                    
                    
                }
            }
    }
    
    // MARK: - Delete
    func deleteMain(documentId: String, type: FoodType) {
        FirestoreReference("Menu")
            .document(documentId)
            .delete { error in
                if let err = error {
                    print("Error removing document: \(err)")
                } else {
                    switch type {
                    case .main:
                        self.mainFoods = self.mainFoods.filter { mainFood in
                            mainFood.id != documentId
                        }
                    case .addOn:
                        self.addOns = self.addOns.filter { addOnFood in
                            addOnFood.id != documentId
                        }
                    }
                }
            }
    }
    
    // MARK: - Update
    func updateFood(documentId: String, name: String, price: String, type: FoodType) {
        FirestoreReference("Menu")
            .document(documentId)
            .updateData([
                "name": name,
                "price": Double(price)!
            ]) { err in
                if let err = err {
                    print("Error updating document: \(err)")
                } else {
                    if type == .main {
                        self.mainFoods = self.mainFoods.map { main -> MainFood in
                            var main = main
                            if main.id == documentId {
                                main.itemName = name
                                main.price = Double(price)!
                            }
                            return main
                        }
                    } else {
                        self.addOns = self.addOns.map { main -> AddOnItem in
                            var main = main
                            if main.id == documentId {
                                main.itemName = name
                                main.price = Double(price)!
                            }
                            return main
                        }
                    }
                    print("Document successfully updated")
                }
            }
    }
    
}
