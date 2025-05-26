//
//  HomeView.swift
//  CalCounter
//
//  Created by pritam on 2025-05-25.
//

import SwiftUI
import UIKit
import Charts

struct HomeView: View {
    
    @State var viewModel = FoodViewModel()

    
    var body: some View {
        NavigationStack {
            
            
            VStack(alignment: .leading) {
                Text("Add Meal")
                        .font(.headline)
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
                
//                Chart(viewModel.dayCalories) { entry in
//                    BarMark(
//                        x: .value("Date", entry.date, unit: .day),
//                        y: .value("Calories", entry.netCalories)
//                    )
//                    .foregroundStyle(.blue)
//                }
//                .chartXAxis {
//                    AxisMarks(values: .stride(by: .day)) { value in
//                        AxisGridLine()
//                        AxisValueLabel(format: .dateTime.weekday(.abbreviated))
//                    }
//                }
//                .frame(height: 200)
//                .padding()

              
                
                
                
                
            }.padding()
            .navigationTitle("Cal Counter")
            .navigationBarTitleDisplayMode(.inline)

        }
    }
}

#Preview {
    HomeView()
}



extension UIApplication {
    func hideKeyboard() {
        sendAction(#selector(UIResponder.resignFirstResponder),
                   to: nil, from: nil, for: nil)
    }
}

