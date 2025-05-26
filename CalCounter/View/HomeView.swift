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
    var body: some View {
        NavigationStack {
            TabView {
                CalorieView()
                    .tabItem {
                        Label("Calorie", systemImage: "flame.fill")
                    }
                
                
                WeightView()
                    .tabItem {
                        Label("Weight", systemImage: "figure.run")
                    }
                
                SettingsView()
                    .tabItem {
                        Label("Settings", systemImage: "gear")
                    }
                
                
            }
            .navigationTitle("Minimalist Cal")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    HomeView()
}




