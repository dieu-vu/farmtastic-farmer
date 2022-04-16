//
//  ProductResultView.swift
//  FarmtasticFarmer
//
//  Created by Trung on 8.4.2022.
//

import SwiftUI

struct ProductResultView: View {
    let products: [Product]
    
    var body: some View {
        VStack {
            Text ("Search Results")
                .font(.headline)
                .fontWeight(.bold)
            List {
                ForEach(products, id: \.name) { product in
                    ProductResultCard(product: product)
                }
            }
        }
        .padding(.top, 10.0)
        
    }
}

struct ProductResultView_Previews: PreviewProvider {
    static var previews: some View {
        ProductResultView(products: Product.sampleProductsList)
    }
}
