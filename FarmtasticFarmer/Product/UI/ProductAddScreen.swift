//
//  ProductAddScreen.swift
//  FarmtasticFarmer
//
//  Created by Trung on 15.4.2022.
//

import SwiftUI

struct ProductAddScreen: View {
    let categories = ["Meat", "Vegetables", "Fruit"]
    let units = ["kg", "l", "piece"]
    @State var selectedUnit = 0
    @State var selectedCategory = 0
    @State var selectedDateHarvest = Date()
    @State var quantity: Int = 0
    @State var price: Double = 0.0
    
    let formatterDecimal: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }()
    
    var body: some View {
        Form {
            VStack(alignment: .leading, spacing: 0){
                Text("Choose category").font(.headline)
                Picker(selection: $selectedCategory,
                       label:Text(""))
                {
                    ForEach(0 ..< 3) {
                        Text(self.categories[$0]).foregroundColor(.red)
                    }
                }.padding(4)
            }.pickerStyle(.segmented)
            //.pickerStyle(.menu)
            
            VStack(alignment: .leading, spacing: 6){
                Text("Choose Product Image").bold()
                Image ("entrecote")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 200)
            }
            
            DatePicker("Harvest day?", selection: $selectedDateHarvest, displayedComponents: .date)
            
            HStack(spacing: 0){
                VStack(alignment: .leading){
                    Text("Quantity").bold()
                    TextField("Quantity", value: $quantity, formatter: NumberFormatter())                .textFieldStyle(RoundedBorderTextFieldStyle())
                    Text("Price per Unit").bold()
                    
                    TextField("Price per unit", value: $price, format: .currency(code: "EUR")).keyboardType(.decimalPad)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    /*
                     HStack{
                     TextField("Price per unit", value: $price, formatter: formatterDecimal)             .textFieldStyle(RoundedBorderTextFieldStyle())
                     Text("€").bold()
                     }*/
                }.frame(minWidth: 0, maxWidth: .infinity)
                VStack(alignment: .leading){
                    HStack{
                        Text("Unit").bold()
                        VStack {
                            Picker("", selection: $selectedUnit) {
                                ForEach(units, id: \.self) {
                                    Text($0)                                      .foregroundColor(.yellow)
                                        .font(.title3)
                                    
                                }
                            }.pickerStyle(.menu)
                                //.background(Color.red)
                        }  .frame(width: 50)
                            .clipped()
                            .transition(.scale)
                            //.background(Color.red)
                            .overlay(
                                RoundedRectangle(cornerRadius: 6)
                                    .stroke(Color.gray, lineWidth: 1)
                            )
                    }
                    
                    Spacer()
                }.frame(minWidth: 0, maxWidth: .infinity).padding()
            }
        }
    }
}

struct ProductAddScreen_Previews: PreviewProvider {
    static var previews: some View {
        ProductAddScreen()
    }
}
