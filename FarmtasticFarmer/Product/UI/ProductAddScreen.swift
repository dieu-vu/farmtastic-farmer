//
//  ProductAddScreen.swift
//  FarmtasticFarmer
//
//  Created by Trung on 15.4.2022.
//

import SwiftUI

struct ProductAddScreen: View {
 
    
//    @Binding var category: String
//    @Binding var productName: String
//    @Binding var quantity: Double
//    @Binding var price: Double
//    @Binding var harvestDate: Date
    
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
            AddProductForm()
            
        }.navigationBarHidden(true)
    }
}

struct ProductAddScreen_Previews: PreviewProvider {
    static var previews: some View {
        ProductAddScreen()
    }
}
