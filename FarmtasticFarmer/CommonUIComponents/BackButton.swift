//
//  BackButton.swift
//  FarmtasticFarmer
//
//  Created by Giang Nguyen on 25.4.2022.
//

import SwiftUI

// Reusable back button for the app
struct BackButton: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }) {
            Image(systemName: "chevron.left").foregroundColor(.black)
        }
    }
}

struct BackButton_Previews: PreviewProvider {
    static var previews: some View {
        BackButton()
    }
}
