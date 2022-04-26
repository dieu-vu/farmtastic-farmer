//
//  AddProductForm.swift
//  FarmtasticFarmer
//
//  Created by Dieu Vu on 4/26/22.
//

import SwiftUI

struct AddProductForm: View {
    let categories = ["Meat", "Vegetables", "Fruit", "Egg & Dairy"]
        
    let units = ["kg", "liter", "piece"]
    @Binding var selectedUnit: Int
    @Binding var selectedCategory: Int

    @Binding var productName: String
    @Binding var quantity: Double
    @Binding var price: Double
    @Binding var harvestDate: Date

    
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
                    ForEach(0 ..< 4) {
                        Text(self.categories[$0]).foregroundColor(.red)
                    }
                }.padding(4)
            }.pickerStyle(.segmented)
            //.pickerStyle(.menu)
            
            VStack(alignment: .leading, spacing: 6){
                    Text("Choose Product Image").bold()
                VStack (alignment: .center){
                    Image ("entrecote")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300 , height: 200, alignment: .center)
                }.padding()
            }
            
           
            HStack(alignment: .top, spacing: 0) {
                Text("Product name")
                Spacer()
                TextField("Enter text", text: $productName)
            }
            .padding()
            
            DatePicker("Harvest day?", selection: $harvestDate, displayedComponents: .date)
            
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
                                    Text($0)
                                        .foregroundColor(.yellow)
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
            HStack{
                Button(action: {
                    print("harvest date from form", harvestDate)
                    print("price from form", price)
                    var newProduct = ProductJSON()
                    newProduct.product_name = productName
                    newProduct.category = categories[selectedCategory]
                    newProduct.unit = categories[selectedUnit]
                    newProduct.unit_price = Double(price)
                    newProduct.harvest_date = harvestDate
                    newProduct.selling_quantity = quantity
                    print("newProduct from form", newProduct)

                }, label:
                {
                    Text("Add")
                })
                .buttonStyle(BorderlessButtonStyle())
                
                Spacer()
                Button(action: {
                    productName = ""
                    quantity = 0.0
                    harvestDate = Date()
                    price = 0.0
                    selectedUnit = 0
                    selectedCategory = 0
                }, label: {
                        Text("Clear")
                })
                .buttonStyle(BorderlessButtonStyle())
                
            }.padding()
        }
    }
}

//struct AddProductForm_Previews: PreviewProvider {
//    static var previews: some View {
//        AddProductForm(category: "", productName: "", quantity: 0.0, price: 0.0, harvestDate: Date())
//    }
//}
