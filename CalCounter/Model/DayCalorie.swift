//
//  DayCalorie.swift
//  CalCounter
//
//  Created by pritam on 2025-05-25.
//

import Foundation

struct DayCalorie: Identifiable, Codable {
    var id: UUID = UUID()
    var netCalories: Int
    var date: Date
}
