//
//  Order.swift
//  Cashier
//
//  Created by Swee Kwang Chua on 15/6/22.
//

import Foundation

struct Order {
    var kitchStatus: Bool
    var customerName: String
    var phoneNumber: String
    var foods: [Food]
    var dateAdded: Date
    var paymentType: Int
    var cashGiven: Double?
    var totalcost: Double
}
