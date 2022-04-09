//
//  FormView.swift
//  FarmtasticFarmer
//
//  Created by hanghuynh on 7.4.2022.
//

import SwiftUI

struct FormView: View {
    
    var formTitle: String
    @State private var newName: String = ""
    @State private var newAddress: String = ""
    @State private var newNumber: String = ""
    
    var body: some View {
        VStack{
            Text("\(formTitle)").font(.title).bold().padding(16)
            TextField(text: $newName, prompt: Text("New Name")) {
                Text("New name")
            }
            .textFieldStyle(.roundedBorder)
            .padding()
            TextField(text: $newAddress, prompt: Text("New address")) {
                Text("New address")
            }
            .textFieldStyle(.roundedBorder)
            .padding()
            TextField(text: $newNumber, prompt: Text("New number")) {
                Text("New number")
            }
            .textFieldStyle(.roundedBorder)
            .padding()
        }
        .padding()
    }
}


struct FormView_Previews: PreviewProvider {
    static var previews: some View {
        FormView(formTitle: "Update Profile")
    }
}
