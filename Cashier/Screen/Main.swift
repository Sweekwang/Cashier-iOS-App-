//
//  Main.swift
//  Cashier
//
//  Created by Swee Kwang Chua on 15/6/22.
//

import SwiftUI

struct Main: View {
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            
            Cashier()
                .tabItem {
                    Label("Items", systemImage: "tray")
                }
            
            FoodSetting()
                .tabItem {
                    Label("Items", systemImage: "square.grid.2x2")
                }
            
        }
    }
}

struct Main_Previews: PreviewProvider {
    static var previews: some View {
        Main()
    }
}
