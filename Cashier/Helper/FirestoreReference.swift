//
//  FirestoreReference.swift
//  Cashier
//
//  Created by Swee Kwang Chua on 17/6/22.
//

import Foundation
import FirebaseFirestore

func FirestoreReference(_ collection: String) -> CollectionReference {
    
    return Firestore.firestore().collection(collection)
}
