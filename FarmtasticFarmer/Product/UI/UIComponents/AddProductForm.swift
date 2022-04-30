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
    @State var navigateToMainList: Bool = false

    
    // Variable to disable from when price, name and quantity is missing
    var disableForm: Bool {
        productName.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty || quantity == 0.0 || price == 0.0
    }
    
    // Tab selection
    @Binding var tabSelection: Int
    
    // If navigate from detail product view, switch to "update" form
    @State var isUpdating: Bool
    @State var productId: Int?
    
    // Default categories and units:
    let categories = ["Meat", "Vegetables", "Fruit", "Egg & Dairy"]
    let units = ["kg", "piece", "liter"]
    
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
                    Section(header: Text(Translation().ProductImage)) {
                        VStack (alignment: .center){
                            placeHolderImage
                                .resizable()
                                .scaledToFit()
                                .frame(width: 300 , height: 200, alignment: .center)
                            HStack{
                                Button(Translation().ProductLibrary){
                                    selectedImageSource = .photoLibrary
                                    isShowingImagePicker = true
                                }
                                Text("|")
                                Button(Translation().ProductCamera){
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
                Section(header: Text(Translation().ProductInfo)) {
                    VStack(alignment: .leading) {
                        Text(Translation().ProductChooseCategory + ": ").bold()
                        Picker(selection: $selectedCategory,
                               label:Text(""))
                        {
                            ForEach(0 ..< 4) {
                                Text(self.categories[$0]).foregroundColor(.red)
                            }
                        }.pickerStyle(.segmented)
                    }
                    HStack(alignment: .top, spacing: 0) {
                        Text(Translation().ProductName + ": ").bold()
                        Spacer()
                        TextField(Translation().ProductEnterText, text: $productName)
                    }
                    DatePicker(Translation().HarvestDate + ": ", selection: $harvestDate, displayedComponents: .date)
                    HStack(spacing: 0){
                        VStack(alignment: .leading){
                            Text(Translation().ProductQuantity).bold()
                            HStack {
                                TextField(Translation().ProductQuantity, value: $quantity, formatter: NumberFormatter())                .textFieldStyle(RoundedBorderTextFieldStyle())
                                HStack{
                                    Text(Translation().ProductUnit).bold()
                                    VStack {
                                        Picker("", selection: $selectedUnit) {
                                            ForEach(0 ..< 3) {
                                                Text(self.units[$0])
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
                                Text(Translation().PricePerUnit).bold()
                                TextField(Translation().PricePerUnit, value: $price, format: .currency(code: "EUR")).keyboardType(.decimalPad)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                            }
                        }
                    }
                }
                .onAppear{
                    if productId != nil {
                        prefillFormIfUpdating()}}
            }
            .toast(isPresenting: $showToast, duration: 1) {
                AlertToast(displayMode: .alert, type: .complete(Color("DarkGreen")), title: "Success!")
            }
            
            
            HStack{
                ButtonView(buttonText: {if isUpdating {return Translation().Save} else {return Translation().Add}}(),
                           buttonColorLight: disableForm ? "Grey" : "LightGreen",
                           buttonColorDark: disableForm ? "Grey" :  "DarkGreen",
                           buttonAction: {
                    // Gather data from form to send to product data controller
                    // Handle add new or update product
                    print("SELECTED UNIT", selectedUnit)
                    handleAddProductData()
                    clearForm()
                    if isUpdating {productDataController.selectedProduct = []}
                    // Navigate to main product list view
                    tabSelection = 1
                    showToast.toggle()
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        navigateToMainList = true
                    }
                })
                // Disable add button if there is no info filled in Product name, price and quantity
                .disabled(disableForm)
                NavigationLink("", destination: BaseView(), isActive: $navigateToMainList)
//                NavigationLink("", destination: ProductMainScreen(tabSelection: $tabSelection, products: productDataController.allProducts), isActive: $navigateToMainList)
                ButtonView(buttonText: Translation().Clear,
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
        print("unit from form", selectedUnit)
        print("unit from form", units[selectedUnit])

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
            productDataController.updateProduct(description: newProduct, productId: productId!)
        }
    }
    
    func prefillFormIfUpdating () {
        productDataController.getProductById(productId: productId!)
        print("updating product id", productDataController.selectedProduct[0].product_id)
        if isUpdating && productDataController.selectedProduct.count > 0 {
            productName = productDataController.selectedProduct[0].product_name ?? ""
            quantity = productDataController.selectedProduct[0].selling_quantity
            price = productDataController.selectedProduct[0].unit_price
            harvestDate = productDataController.selectedProduct[0].harvest_date ?? Date()
            switch productDataController.selectedProduct[0].category {
            case "Meat":
                selectedCategory = 0
            case "Vegetables":
                selectedCategory = 1
            case "Fruit":
                selectedCategory = 2
            case "Egg & Dairy":
                selectedCategory = 3
            case .none:
                selectedCategory = 0
            case .some(_):
                selectedCategory = 0
            }
            
            switch productDataController.selectedProduct[0].unit {
            case "kg":
                selectedUnit = 0
            case "piece":
                selectedUnit = 1
            case "liter":
                selectedUnit = 2
            case .none:
                selectedUnit = 0
            case .some(_):
                selectedUnit = 0
            }
            
        }
    }
}



