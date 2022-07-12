//
//  Food.swift
//  Cashier
//
//  Created by Swee Kwang Chua on 15/6/22.
//

import Foundation

struct Food: Identifiable {
    var id: String = UUID().uuidString
    
    var name: String
    var price: Double
    var addOns: [String: [String: Double]]
    var totalPrice: Double
    var description: String?
}
