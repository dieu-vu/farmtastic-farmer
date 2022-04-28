//
//  ProductAddScreen.swift
//  FarmtasticFarmer
//
//  Created by Trung on 15.4.2022.
//

import SwiftUI

struct ProductAddScreen: View {
    
    @EnvironmentObject var productDataController: ProductDataController
    @Environment(\.managedObjectContext) private var viewContext
    @Binding var tabSelection: Int
    
    let categories = ["Meat", "Vegetables", "Fruit", "Egg & Dairy"]
        
    let units = ["kg", "liter", "piece"]
    
    @State var category: String = ""
    @State var productName: String = ""
    @State var quantity: Double = 0.0
    @State var price: Double = 0.0
    @State var harvestDate: Date = Date()
    @State var selectedUnit = 0
    @State var selectedCategory = 0
    @State private var productImage: UIImage?

    @State var screenTitle = "product.addProduct"
    @State var hasBackButton = true
    
    let formatterDecimal: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }()
    
    var body: some View {
        VStack {
            ScreenLayout(screenTitle: $screenTitle, hasBackButton: $hasBackButton)
            AddProductForm(tabSelection: $tabSelection, selectedUnit: $selectedUnit, selectedCategory: $selectedCategory, productName: $productName, quantity: $quantity, price: $price, harvestDate: $harvestDate, productImage: $productImage)
            
        }.navigationBarHidden(true)
    }
    
}

struct ProductAddScreen_Previews: PreviewProvider {
    static var previews: some View {
        ProductAddScreen(tabSelection: Binding.constant(Constants.productTab))
    }
}
