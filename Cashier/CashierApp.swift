//
//  CashierApp.swift
//  Cashier
//
//  Created by Swee Kwang Chua on 15/6/22.
//

import SwiftUI

@main
struct CashierApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
