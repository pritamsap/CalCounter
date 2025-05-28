//
//  WeightViewModel.swift
//  CalCounter
//
//  Created by pritam on 2025-05-26.
//

import Foundation
import SwiftUI


@Observable
class WeightViewModel {
    var weights: [WeightModel] = []
    
    var currentWeight: Double = 0.0
    var currentDate = Date()
    
    @AppStorage("savedWeights") @ObservationIgnored private var savedWeights: Data = Data()

    
    func addWeight() {
        print(" Before added weight is: \(currentWeight)")
        print("Before added date is \(currentWeight)")
        let newWeight = WeightModel(weight: currentWeight, date: currentDate)
        print("Added weight:", newWeight.weight)

        if filterWeight(for: currentDate).count == 0 {
            weights.append(newWeight)
            currentWeight = 0.0
            currentDate = Date()
            saveWeights()
        }
        currentWeight = 0.0
        currentDate = Date()
       
       
    }
    
    func filterWeight(for date: Date) -> [WeightModel] {
        weights.filter {
            Calendar.current.isDate($0.date, inSameDayAs: date)
        }
    }

    

    
    func saveWeights() {
        if let encoded = try? JSONEncoder().encode(weights) {
            savedWeights = encoded
        }
    
    }
    
    func loadWight() {
        if let decoded = try? JSONDecoder().decode([WeightModel].self, from: savedWeights) {
            weights = decoded
        }
    }
    
    func deleteWeight(at offsets: IndexSet) {
           weights.remove(atOffsets: offsets)
           saveWeights()
    }
    
    var dateFormatter: DateFormatter {
       let formatter = DateFormatter()
       formatter.dateStyle = .medium  // e.g., May 26, 2025
       formatter.timeStyle = .none
       return formatter
   }
    
    
}
