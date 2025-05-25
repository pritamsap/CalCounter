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
            VStack {
                Form {
                    Section(header: Text("Add Meal").font(.subheadline)) {
                        TextField("Food Name", text: $viewModel.newName)
                        TextField("Calorie", value: $viewModel.newCalories, formatter: NumberFormatter())
                                    .keyboardType(.numberPad)
                
                    }
        
                    Button("Add Meal") {
                        viewModel.addItem()
                        UIApplication.shared.hideKeyboard()
                    }
                }
                
                
                Text("Today's Meals")
                
                
                List {
                    ForEach(viewModel.items) { item in
                        VStack {
                            FoodMealCard(item: item)
                        }
                    }.onDelete(perform: viewModel.deleteItem)
                }
                
                
                
                
            }
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

