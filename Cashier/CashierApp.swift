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
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
            Main()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
