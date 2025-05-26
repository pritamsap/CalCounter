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
    var dayCalories: [DayCalorie] = []
    
    var newName = ""
    var newCalories = 0
    var foodLogo = ""
    var newDate = Date()
    
    var netCalories = 0
    
    @AppStorage("savedItems") @ObservationIgnored private var savedData: Data = Data()
    
    @AppStorage("savedDayCalorie") @ObservationIgnored private var savedDayCalorie: Data = Data()

    func addItem() {
        let newItem = FoodModel(foodName: newName, calories: newCalories,  foodLogo: foodLogo, date: newDate)
        items.append(newItem)
        updateTodayCalories(for: newItem)
        newName = ""
        newCalories = 0
        foodLogo = ""
        newDate = Date()
        saveItems()
        
    }
    
    func updateTodayCalories(for item: FoodModel) {
        let itemDay = Calendar.current.startOfDay(for: item.date)

          if let index = dayCalories.firstIndex(where: {
              Calendar.current.isDate($0.date, inSameDayAs: itemDay)
          }) {
              dayCalories[index].netCalories += item.calories
          } else {
              let newDayCalorie = DayCalorie(netCalories: item.calories, date: item.date)
              dayCalories.append(newDayCalorie)
          }

    }
    
    func saveItems() {
        if let encoded = try? JSONEncoder().encode(items) {
            savedData = encoded
        }
        
        if let encoded = try? JSONEncoder().encode(dayCalories) {
            savedDayCalorie = encoded
        }
    }
    
    func loadItems() {
        if let decoded = try? JSONDecoder().decode([FoodModel].self, from: savedData) {
            items = decoded
        }
        
        if let decoded = try? JSONDecoder().decode([DayCalorie].self, from: savedDayCalorie) {
            dayCalories = decoded
        }
    }
    
    func deleteItem(at offsets: IndexSet) {
           items.remove(atOffsets: offsets)
           saveItems()
       }
    
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium  // e.g., May 26, 2025
        formatter.timeStyle = .none
        return formatter
    }
    
    func meals(for date: Date) -> [FoodModel] {
        items.filter {
            Calendar.current.isDate($0.date, inSameDayAs: date)
        }
    }


    
    
    
}
