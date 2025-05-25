//
//  FoodMealCard.swift
//  CalCounter
//
//  Created by pritam on 2025-05-25.
//

import SwiftUI

struct FoodMealCard: View {
    
    var item: FoodModel
    
    var body: some View {
        HStack(spacing: 16) {
                    // SF Symbol
                    Image(systemName: "takeoutbag.and.cup.and.straw.fill")
                        .font(.system(size: 28))
                        .foregroundColor(.red)

                    // Title and Subtitle
                    VStack(alignment: .leading, spacing: 4) {
                        Text(item.foodName)
                            .font(.headline)
                            .bold()
                        Text("\(item.calories) Calories")
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
    FoodMealCard(item: FoodModel(foodName: "Sandwich", calories: 250, foodLogo: "Apple"))
}
