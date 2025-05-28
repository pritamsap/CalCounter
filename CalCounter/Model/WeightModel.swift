//
//  WeightModel.swift
//  CalCounter
//
//  Created by pritam on 2025-05-26.
//

import Foundation



struct WeightModel: Identifiable, Codable {
    var id: UUID = UUID()
    var weight: Double
    var date: Date
}
