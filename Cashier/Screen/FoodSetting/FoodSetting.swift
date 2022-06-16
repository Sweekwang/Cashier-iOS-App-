//
//  Purchase.swift
//  Cashier
//
//  Created by Swee Kwang Chua on 16/6/22.
//

import SwiftUI

struct FoodSetting: View {
    var body: some View {
        NavigationView {
            List {
                // MARK: - Mains Section
                Section {
                    Text("TEST")
                        .listRowSeparator(.hidden)
                } header: {
                    TextTrailingButton(title: "Main", action: {})
                }

                // MARK: - Add ons Section
                Section {
                    Text("TEST")
                        .listRowSeparator(.hidden)
                } header: {
                    TextTrailingButton(title: "Add Ons", action: {})
                }
            } //: List
            
            .navigationTitle("Food Setting")
            .listStyle(.plain)
            
        } //: NavigationView
    }
}


struct Purchase_Previews: PreviewProvider {
    static var previews: some View {
        FoodSetting()
    }
}
