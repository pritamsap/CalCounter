//
//  CalorieScannerViewCard.swift
//  CalCounter
//
//  Created by pritam on 2025-05-28.
//

import SwiftUI
import PhotosUI

struct CalorieScannerViewCard: View {
    @State private var selectedItem: PhotosPickerItem? // hold a selected photo item
    @State private var selectedImage: UIImage? // holds the loaded image
    @State private var showingCamera = false
    
    
    @State var foodName: String = ""
    @State var calorieCount: Int = 0
    @State var date: Date = Date()
    
    var body: some View {
        VStack {
            //  Top Half: Image or Placeholder (can be black or default)
                     ZStack {
                         Color.black.opacity(0.9) // or .clear if you prefer
                             .ignoresSafeArea()

                         if let selectedImage = selectedImage {
                             Image(uiImage: selectedImage)
                                 .resizable()
                                 .scaledToFit()
                                 .padding()
                                 .cornerRadius(15)
                         } else {
                             Text("No Image Selected")
                                 .foregroundStyle(.gray)
                                 .font(.headline)
                         }
                     }
                     .frame(maxHeight: .infinity)
          //   Display the selected image or placeholder

            
            
            // Camera Button
            VStack(spacing: 15) {
                
                // Food Name Field
                TextField("Food Name", text: $foodName)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(10)
                
                // Calorie Field
                TextField("Calorie", value: $calorieCount, formatter: NumberFormatter())
                    .keyboardType(.numberPad)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(10)
                
                HStack(spacing: 8) {
                    Button(action: {
                        showingCamera = true
                    }) {
                        Text("Take Photo")
                            .font(.headline) .frame(maxWidth: .infinity).padding()
                            .background(Color(.systemBackground)).foregroundColor(.white).cornerRadius(10).padding()
                    }.sheet(isPresented: $showingCamera) {
                        CameraView(image: $selectedImage)
                    }
                    
                    
                    
                    // photos picker button
                    PhotosPicker(selection: $selectedItem,
                                 matching: .images, photoLibrary: .shared()
                    ) {
                        Text("Select Photo").font(.headline) .frame(maxWidth: .infinity).padding()
                            .background(Color(.systemBackground)).foregroundColor(.white).cornerRadius(10).padding(.horizontal)
                    }.onChange(of: selectedItem)  {
                        newItem in
                        // Handle the selected item
                        if let newItem = newItem {
                            Task {
                                if let data = try? await newItem.loadTransferable(type: Data.self),
                                   let image = UIImage(data: data) {
                                    selectedImage = image
                                }
                            }
                        }
                    }
                }
                
            }.padding().background(Color.white)
        }
    }
}

#Preview {
    CalorieScannerViewCard()
}
