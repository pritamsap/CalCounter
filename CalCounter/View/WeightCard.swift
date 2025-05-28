//
//  WeightCard.swift
//  CalCounter
//
//  Created by pritam on 2025-05-27.
//

import SwiftUI

struct WeightCard: View {
    var weight: WeightModel
    
    var body: some View {
        HStack(spacing: 16) {
            
                    // SF Symbol
                    Image(systemName: "figure.walk.treadmill")
                        .font(.system(size: 28))
                        .foregroundColor(.red)

                    // Weight and Date
                    VStack(alignment: .leading, spacing: 4) {
                        Text(String(format: "%.1f", weight.weight))
                            .font(.headline)
                            .bold()
                        Text("\(weight.date.formattedDate())")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }

                    Spacer()
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color(.systemGray6))
                )
                .shadow(radius: 0.5)
                .padding(.horizontal)
                .padding(.vertical, 3)
    }
}

#Preview {
    WeightCard(weight: WeightModel(weight: 65.0, date: Date()))
}

extension Date {
    func formattedDate() -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium // e.g., May 27, 2025
        formatter.timeStyle = .none   // hides time
        return formatter.string(from: self)
    }
}
