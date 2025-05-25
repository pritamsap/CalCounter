//
//  HomeView.swift
//  CalCounter
//
//  Created by pritam on 2025-05-25.
//

import SwiftUI
import UIKit

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
                
                // Add Meal Button
                   Button(action: {
                       viewModel.addItem()
                       UIApplication.shared.hideKeyboard()
                   }) {
                       Text("Add Meal")
                           .frame(maxWidth: .infinity)
                           .padding()
                           .background(Color.blue)
                           .foregroundColor(.white)
                           .cornerRadius(10)
                   }
                
                
                
                VStack(alignment: .leading) {
                    Text("Today's Meals: \(viewModel.netCalories) calories")
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 0.5) {
                                ForEach(viewModel.items) { item in
                                    FoodMealCard(item: item)
                                }
                            }
                            .padding(.vertical, 4)
                        }

                }.padding(.vertical, 20)
                Spacer()
              
                
                
                
                
            }.padding()
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

