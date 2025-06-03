//
//  CameraView.swift
//  CalCounter
//
//  Created by pritam on 2025-06-03.
//

import Foundation
import UIKit
import SwiftUI

struct CameraView: UIViewControllerRepresentable {
    @Binding var image: UIImage? // bind to the parent view's state
    @Environment (\.presentationMode) var presentationMode // Dismiss the view

    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController() // Create the camera picker
        picker.delegate = context.coordinator // set the coordinate as a delegate
        picker.sourceType = .camera // set the source to the camera
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        // No Updates needed
    }
    
    func makeCoordinator() -> Coordinater {
        Coordinater(self)
    }
    
    class Coordinater: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        let parent: CameraView
        
        init(_ parent: CameraView) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let image = info[.originalImage] as? UIImage {
                parent.image = image // pass the selected image to the parent
            }
            parent.presentationMode.wrappedValue.dismiss() // this will dismiss the picker
        }
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            parent.presentationMode.wrappedValue.dismiss() // Dismiss on cancel
        }
    }
}
