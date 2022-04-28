//
//  ImagePicker.swift
//  FarmtasticFarmer
//
//  Created by Dieu Vu on 4/26/22.
//  Image picker for the add product form

import SwiftUI

struct ImagePicker: UIViewControllerRepresentable {
    
    @Environment(\.presentationMode) var presentationMode
    var selectedSource: UIImagePickerController.SourceType
    
    @Binding var productImage: UIImage?
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        // Create the image picker controller
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = context.coordinator
        
        // Check that this source is available
        if UIImagePickerController.isSourceTypeAvailable(selectedSource){
            imagePickerController.sourceType = selectedSource
        }
        return imagePickerController
    }
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        // Create a coordinator to call if there is not coordinator in the context
        Coordinator(parent: self)
    }
    
    // Create the coordinator that implement the method to handle the events from the UIImagePicker
    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        var parent: ImagePicker
        
        init (parent: ImagePicker) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            // Check if we can get the image
            if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
                // If able to get the UI image, pass this to the Add Product Form
                parent.productImage = image
            } 
            // Dismiss this view
            parent.presentationMode.wrappedValue.dismiss()
        }
    }
}
