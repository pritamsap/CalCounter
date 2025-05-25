//
//  FoodViewModel.swift
//  CalCounter
//
//  Created by pritam on 2025-05-25.
//

import Foundation
import SwiftUI

@Observable
class FoodViewModel {
    var items: [FoodModel] = []
    
    var newName = ""
    var newCalories = 0
    var foodLogo = ""
    
    @AppStorage("savedItems") @ObservationIgnored private var savedData: Data = Data()

    func addItem() {
        let newItem = FoodModel(foodName: newName, calories: newCalories,  foodLogo: foodLogo)
        items.append(newItem)
        newName = ""
        newCalories = 0
        foodLogo = ""
        saveItems()
        
    }
    
    func saveItems() {
        if let encoded = try? JSONEncoder().encode(items) {
            savedData = encoded
        }
    }
    
    func loadItems() {
        if let decoded = try? JSONDecoder().decode([FoodModel].self, from: savedData) {
            items = decoded
        }
    }
    
    func deleteItem(at offsets: IndexSet) {
           items.remove(atOffsets: offsets)
           saveItems()
       }
    
    
    
    
}
