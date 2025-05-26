//
//  WeightView.swift
//  CalCounter
//
//  Created by pritam on 2025-05-26.
//

import SwiftUI

struct WeightView: View {
    
    @State var weight: Int = 0
    
    var body: some View {
        
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading) {
                    Text("Add Today's Weight")
                        .font(.subheadline)
                        .fontWeight(.bold)
                    
                    
                    // Weight Field
                    TextField("Calorie", value: $weight, formatter: NumberFormatter())
                        .keyboardType(.numberPad)
                        .padding()
                        .background(Color(.secondarySystemBackground))
                        .cornerRadius(10)
                      
                    
                }.padding(.vertical)
            }
        }
    }
}

#Preview {
    WeightView()
}
