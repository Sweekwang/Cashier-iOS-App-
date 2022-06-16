//
//  Order.swift
//  Cashier
//
//  Created by Swee Kwang Chua on 15/6/22.
//

import Foundation

struct Order {
    var datetime: Date
    var kitchStatus: Bool
    var saladBarStatus: Bool
    var orderStatus: Bool
    var foods: [Food]
}
