//
//  ProductResultView.swift
//  FarmtasticFarmer
//
//  Created by Trung on 8.4.2022.
//

import SwiftUI

struct ProductResultView: View {
    let products: [Product]
    @State var screenTitle = "product.searchResult"
    @State var hasBackButton = true
    
    var body: some View {
        VStack {
            ScreenLayout(screenTitle: $screenTitle, hasBackButton: $hasBackButton)
            List {
                ForEach(products, id: \.name) { product in
                    ProductResultCard(product: product)
                }
            }
        }.navigationBarHidden(true)
        .padding(.top, 10.0)
        
    }
}

struct ProductResultView_Previews: PreviewProvider {
    static var previews: some View {
        ProductResultView(products: Product.sampleProductsList)
    }
}
