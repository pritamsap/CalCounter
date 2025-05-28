//
//  WeightView.swift
//  CalCounter
//
//  Created by pritam on 2025-05-26.
//

import SwiftUI
import Charts

struct WeightView: View {
    
    @State var weight: Int = 0
    @State var weightViewModel = WeightViewModel()
    
    var body: some View {
        
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading) {
                    Text("Today's Weight")
                        .font(.subheadline)
                        .fontWeight(.bold)
                    
                    
                    // Weight Field - Manual Binding
                    TextField("Weight", text: Binding(
                        get: { String(weightViewModel.currentWeight) },
                        set: { weightViewModel.currentWeight = Double($0) ?? 0.0 }
                    ))
                    .keyboardType(.decimalPad)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(10)
                    
                    
                    // Date Picker Field
                    DatePicker("Select Date", selection: $weightViewModel.currentDate, displayedComponents: .date)
                    
                    
                    // Add Weight Button
                    Button(action: {
                        weightViewModel.addWeight()
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
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 0.5) {
                                    ForEach(weightViewModel.weights) { weight in
                                            WeightCard(weight: weight)
                                    }
                                }
                                .padding(.vertical, 4)
                            }
                    }.padding(.vertical, 20)
                    Spacer()
                    
                      
                    
                    // Graph Chart to display weight on day basis
                    Chart(weightViewModel.weights) { entry in
                        LineMark(
                            x: .value("Date", entry.date),
                            y: .value("Weight", entry.weight)
                        )
                        PointMark(
                            x: .value("Date", entry.date),
                            y: .value("Weight", entry.weight)
                        )
                        .symbolSize(30) // smaller dot if you want a subtle look
                    }
                    .chartXAxis {
                        AxisMarks(values: .stride(by: .day)) { value in
                            AxisGridLine()
                            AxisValueLabel(format: .dateTime.day().month())
                        }
                    }
                    .chartYAxis {
                        AxisMarks(position: .leading)
                    }
                    .chartYScale(domain: 0...200) // adjust based on your weight range
                    .frame(height: 250)
                    .padding()

     
                }.padding(.horizontal)
            }
        }
    }
}

#Preview {
    WeightView()
}
