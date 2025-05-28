//
//  CalorieView.swift
//  CalCounter
//
//  Created by pritam on 2025-05-26.
//

import SwiftUI
import UIKit
import Charts

struct CalorieView: View {
    
    @State var viewModel = FoodViewModel()

    
    var body: some View {
        NavigationStack {
            
            ScrollView {
                VStack(alignment: .leading) {
                    Text("Add Meal")
                        .font(.subheadline)
                        .fontWeight(.bold)
                    
                    // Food Name Field
                    TextField("Food Name", text: $viewModel.newName)
                        .padding()
                        .background(Color(.secondarySystemBackground))
                        .cornerRadius(10)
                    
                    // Calorie Field
                    TextField("Calorie", value: $viewModel.newCalories, formatter: NumberFormatter())
                        .keyboardType(.numberPad)
                        .padding()
                        .background(Color(.secondarySystemBackground))
                        .cornerRadius(10)
                    
                    // Date Picker Field
                    DatePicker("Select Date", selection: $viewModel.newDate, displayedComponents: .date)
                    
                    
                    // Add Meal Button
                    Button(action: {
                        viewModel.addItem()
                        UIApplication.shared.hideKeyboard()
                    }) {
                        Text("Add")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }.padding(.vertical)
                    
                    
                    // Display Food Meal for Each Corresponding day
                    VStack(alignment: .leading) {
                        ForEach(viewModel.dayCalories) { item in
                            Text("\(viewModel.dateFormatter.string(from: item.date)): \(item.netCalories) calories")
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 0.5) {
                                    ForEach(viewModel.meals(for: item.date)) { food in
                                        FoodMealCard(item: food)
                                    }
                                }
                                .padding(.vertical, 4)
                            }
                        }
                    }.padding(.vertical, 20)
                    Spacer()
                    
                }.padding()
            }
            

        }
    }
}

#Preview {
    CalorieView()
}


extension UIApplication {
    func hideKeyboard() {
        sendAction(#selector(UIResponder.resignFirstResponder),
                   to: nil, from: nil, for: nil)
    }
}
