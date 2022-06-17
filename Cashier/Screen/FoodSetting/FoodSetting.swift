//
//  Purchase.swift
//  Cashier
//
//  Created by Swee Kwang Chua on 16/6/22.
//

import SwiftUI

struct FoodSetting: View {
    @State var showAddMain = false
    @State var showAddAddOns = false
    var viewmodel = FoodSettingViewModel()
    
    var body: some View {
        NavigationView {
            List {
                // MARK: - Mains Section
                Section {
                    Text("TEST")
                        .listRowSeparator(.hidden)
                } header: {
                    TextTrailingButton(title: "Main",
                                       action: { showAddMain.toggle() })
                }

                // MARK: - Add ons Section
                Section {
                    Text("TEST")
                        .listRowSeparator(.hidden)
                } header: {
                    TextTrailingButton(title: "Add Ons", action: { showAddAddOns.toggle() })
                }
            } //: List
            
            .navigationTitle("Food Setting")
            .listStyle(.plain)
            
        } //: NavigationView
        .fullScreenCover(isPresented: $showAddMain,
                         content: { AddFood(title: "Add Mains", action: { viewmodel.addMains(name: "Test", price: "12.00") }) } )
        .fullScreenCover(isPresented: $showAddAddOns, content: { AddFood(title: "Add Add On", action: { }) } )
    }
}


struct Purchase_Previews: PreviewProvider {
    static var previews: some View {
        FoodSetting()
    }
}
