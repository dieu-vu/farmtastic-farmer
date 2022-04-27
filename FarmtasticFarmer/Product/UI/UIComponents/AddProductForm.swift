//
//  AddProductForm.swift
//  FarmtasticFarmer
//
//  Created by Dieu Vu on 4/26/22.
// Handle Add product form UI and parse JSON for product extra info object

import SwiftUI

struct AddProductForm: View {
    @EnvironmentObject var productDataController: ProductDataController
    
    // Tab selection
    @Binding var tabSelection: Int
    
    let categories = ["Meat", "Vegetables", "Fruit", "Egg & Dairy"]
    
    let units = ["kg", "liter", "piece"]
    @Binding var selectedUnit: Int
    @Binding var selectedCategory: Int
    
    @Binding var productName: String
    @Binding var quantity: Double
    @Binding var price: Double
    @Binding var harvestDate: Date
    
    
    // Image Picker
    @State private var isShowingImagePicker = false
    @State private var selectedImageSource = UIImagePickerController.SourceType.photoLibrary
    @State var placeHolderImage = Image("placeholder")
    
    // Product Image
    @Binding var productImage: UIImage?
    
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
                    placeHolderImage
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300 , height: 200, alignment: .center)
                    HStack{
                        Button("Photo library"){
                            selectedImageSource = .photoLibrary
                            isShowingImagePicker = true
                        }
                        Text("|")
                        Button("Camera"){
                            selectedImageSource = .camera
                            isShowingImagePicker = true
                        }
                    }
                    .sheet(isPresented: $isShowingImagePicker, onDismiss: loadImage){
                        ImagePicker(selectedSource: selectedImageSource, productImage: $productImage)
                    }
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
                    //                        .keyboardType(.numberPad)
                    Text("Price per Unit").bold()
                    
                    TextField("Price per unit", value: $price, format: .currency(code: "EUR")).keyboardType(.decimalPad)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    //                        .keyboardType(.numberPad)
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
                        }  .frame(width: 50)
                            .clipped()
                            .transition(.scale)
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
                    // Gather data from form to send to product data controller
                    handleAddProductData()
                    clearForm()
                    // Navigate to main product list view
                    tabSelection = 1
                }, label:
                        {
                    Text("Add")
                })
                .buttonStyle(BorderlessButtonStyle())
                
                Spacer()
                Button(action: {
                    clearForm()
                }, label: {
                    Text("Clear")
                })
                .buttonStyle(BorderlessButtonStyle())
                
            }.padding()
        }
    }
    
    func loadImage() {
        // Check if an image was selected
        if productImage != nil {
            // Set it as the placeholder image
            placeHolderImage = Image(uiImage: productImage!)
        }
    }
    
    func clearForm (){
        productName = ""
        quantity = 0.0
        harvestDate = Date()
        price = 0.0
        selectedUnit = 0
        selectedCategory = 0
        placeHolderImage = Image("placeholder")
    }
    
    func handleAddProductData(){
        // Gather data from form to send to product data controller
        print("harvest date from form", harvestDate)
        print("price from form", price)
        var newProduct = ProductJSON()
        newProduct.product_name = productName.trimmingCharacters(in: .whitespacesAndNewlines)
        newProduct.category = categories[selectedCategory]
        newProduct.unit = units[selectedUnit]
        newProduct.unit_price = Double(price)
        newProduct.harvest_date = Utils.utils.convertDateToISOString(harvestDate)
        newProduct.selling_quantity = Double(quantity)
        print("newProduct from form", newProduct)
        productDataController.addProduct(description: newProduct, image: productImage ?? UIImage(imageLiteralResourceName: "placeholder"))
    }
    
}

