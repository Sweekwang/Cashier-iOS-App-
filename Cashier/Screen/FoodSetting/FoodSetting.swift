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
    @StateObject var viewmodel = FoodSettingViewModel()
    
    // MARK: - Body
    var body: some View {
        NavigationView {
            List {
                // MARK: - Mains Section
                Section {
                    ForEach(viewmodel.mainFoods) { food in
                        FoodDetails(name: food.itemName, price: food.price)
                            .listRowSeparator(.hidden)
                            .swipeActions(allowsFullSwipe: false) {
                                Button(role: .destructive) {
                                    viewmodel.deleteMain(documentId: food.id, type: .main)
                                } label: {
                                    Label("Delete", systemImage: "trash.fill")
                                }
                            }
                            .onTapGesture {
                                viewmodel.name = food.itemName
                                viewmodel.price = food.price
                                viewmodel.documentId = food.id
                                showAddMain = true
                            }
                    }
                    
                } header: {
                        TextTrailingButton(title: "Main",
                                           action: { showAddMain.toggle() })
                    
                }
                
                // MARK: - Add ons Section
                Section {
                    ForEach(viewmodel.addOns) { food in
                        FoodDetails(name: food.itemName, price: food.price)
                            .listRowSeparator(.hidden)
                            .swipeActions(allowsFullSwipe: false) {
                                Button(role: .destructive) {
                                    viewmodel.deleteMain(documentId: food.id, type: .addOn)
                                } label: {
                                    Label("Delete", systemImage: "trash.fill")
                                }
                            }
                            .onTapGesture {
                                viewmodel.name = food.itemName
                                viewmodel.price = food.price
                                viewmodel.documentId = food.id
                                showAddMain = true
                            }
                    }
                } header: {
                    TextTrailingButton(title: "Add Ons", action: { showAddAddOns.toggle() })
                }
            } //: List
            .navigationTitle("Food Setting")
            .listStyle(.plain)
            
        } //: NavigationView
        .background(.red)
        .fullScreenCover(isPresented: $showAddMain,
                         content: { AddFood(title: "Add Mains", action: { name, price in
            if let id = viewmodel.documentId {
                viewmodel.updateFood(documentId: id, name: name, price: price, type: .main)
                return
            }
            viewmodel.addFood(name: name, price: price, type: .main)
            
        }, name: viewmodel.name, price: viewmodel.price, documentId: viewmodel.documentId ) } )
        .fullScreenCover(isPresented: $showAddAddOns, content: { AddFood(title: "Add Add On", action: { name, price in
            if let id = viewmodel.documentId {
                viewmodel.updateFood(documentId: id, name: name, price: price, type: .addOn)
                return
            }
            viewmodel.addFood(name: name, price: price, type: .addOn)
        }, name: viewmodel.name, price: viewmodel.price, documentId: viewmodel.documentId ) } )
        .onAppear {
            viewmodel.readMain()
            viewmodel.readAddOns()
        }
    }
}


struct Purchase_Previews: PreviewProvider {
    static var previews: some View {
        FoodSetting()
    }
}
