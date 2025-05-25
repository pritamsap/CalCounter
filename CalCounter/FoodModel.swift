//
//  FoodModel.swift
//  CalCounter
//
//  Created by pritam on 2025-05-25.
//

import Foundation


struct FoodModel: Identifiable, Codable {
    var id: UUID = UUID()
    var foodName: String
    var calories: Int
    var foodLogo: String
}
