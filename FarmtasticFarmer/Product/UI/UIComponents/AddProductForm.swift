//
//  AddProductForm.swift
//  FarmtasticFarmer
//
//  Created by Dieu Vu on 4/26/22.
// Handle Add product form UI and parse JSON for product extra info object

import SwiftUI
import AlertToast

struct AddProductForm: View {
    @EnvironmentObject var productDataController: ProductDataController
    @State var showToast = false
    
    // Variable to disable from when price, name and quantity is missing
    var disableForm: Bool {
        productName.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty || quantity == 0.0 || price == 0.0
    }
    
    // Tab selection
    @Binding var tabSelection: Int
    
    // If navigate from detail product view, switch to "update" form
    @State var isUpdating: Bool
    
    // Default categories and units:
    let categories = ["Meat", "Vegetables", "Fruit", "Egg & Dairy"]
    let units = ["kg", "liter", "piece"]
    
    // Binding variable for the form
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
    
    
    var body: some View {
        VStack {
            List {
                // Hide image picker section if user is updating product
                if !isUpdating {
                    Section(header: Text("Product Image")) {
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
                        }
                    }
                }
                Section(header: Text("Product Info")) {
                    VStack(alignment: .leading) {
                        Text("Choose category: ").bold()
                        Picker(selection: $selectedCategory,
                               label:Text(""))
                        {
                            ForEach(0 ..< 4) {
                                Text(self.categories[$0]).foregroundColor(.red)
                            }
                        }.pickerStyle(.segmented)
                    }
                    HStack(alignment: .top, spacing: 0) {
                        Text("Product name: ").bold()
                        Spacer()
                        TextField("Enter text", text: $productName)
                    }
                    DatePicker("Harvest date: ", selection: $harvestDate, displayedComponents: .date)
                    HStack(spacing: 0){
                        VStack(alignment: .leading){
                            Text("Quantity").bold()
                            HStack {
                                TextField("Quantity", value: $quantity, formatter: NumberFormatter())                .textFieldStyle(RoundedBorderTextFieldStyle())
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
                            }
                            HStack {
                                Text("Price per Unit").bold()
                                TextField("Price per unit", value: $price, format: .currency(code: "EUR")).keyboardType(.decimalPad)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                            }
                        }
                    }
                }
            }
            .toast(isPresenting: $showToast, duration: 1) {
                AlertToast(displayMode: .alert, type: .complete(Color("DarkGreen")), title: "Success!")
            }
            HStack{
                ButtonView(buttonText: {if isUpdating {return "Save"} else {return "Add"}}(),
                           buttonColorLight: "LightGreen",
                           buttonColorDark: "DarkGreen",
                           buttonAction: {
                    // Gather data from form to send to product data controller
                    // Handle add new or update product
                    handleAddProductData()
                    clearForm()
                    // Navigate to main product list view
                    tabSelection = 1
                    showToast.toggle()
                })
                // Disable add button if there is no info filled in Product name, price and quantity
                .disabled(disableForm)
                ButtonView(buttonText: "Clear",
                           buttonColorLight: "PinkishRed",
                           buttonColorDark: "PinkishRed",
                           buttonAction: {
                    clearForm()
                })
            }
            .padding(.horizontal, 4)
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
        if !isUpdating {
            productDataController.addProduct(description: newProduct, image: productImage ?? UIImage(imageLiteralResourceName: "placeholder"))
        } else {
            productDataController.updateProduct(description: newProduct)
        }
    }
}



