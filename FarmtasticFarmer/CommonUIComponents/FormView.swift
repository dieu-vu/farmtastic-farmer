//
//  FormView.swift
//  FarmtasticFarmer
//
//  Created by hanghuynh on 7.4.2022.
//

import SwiftUI

// Reusable component for update profile form and add new pickup location (not implemented in this release)

struct FormView: View {
    
    var formTitle: String
    var fieldPlaceholder1: String
    var fieldPlaceholder2: String
    var fieldPlaceholder3: String
    @State private var fieldValue1: String = ""
    @State private var fieldValue2: String = ""
    @State private var fieldValue3: String = ""
    
    var body: some View {
        VStack{
            Text("\(formTitle)").font(.title).bold().padding(16)
            TextField(text: $fieldValue1, prompt: Text("\(fieldPlaceholder1)")) {
                Text("\(fieldPlaceholder1)")
            }
            .textFieldStyle(.roundedBorder)
            .padding()
            TextField(text: $fieldValue2, prompt: Text("\(fieldPlaceholder2)")) {
                Text("\(fieldPlaceholder2)")
            }
            .textFieldStyle(.roundedBorder)
            .padding()
            TextField(text: $fieldValue3, prompt: Text("\(fieldPlaceholder3)")) {
                Text("\(fieldPlaceholder3)")
            }
            .textFieldStyle(.roundedBorder)
            .padding()
        }
        .padding(.horizontal)
    }
}


struct FormView_Previews: PreviewProvider {
    static var previews: some View {
        FormView(formTitle: "Update Profile", fieldPlaceholder1: "New name", fieldPlaceholder2: "New address", fieldPlaceholder3: "New number")
            .previewLayout(.sizeThatFits)
        FormView(formTitle: "New Pickup Point", fieldPlaceholder1: "Location", fieldPlaceholder2: "Date", fieldPlaceholder3: "Time")
            .previewLayout(.sizeThatFits)
    }
}
