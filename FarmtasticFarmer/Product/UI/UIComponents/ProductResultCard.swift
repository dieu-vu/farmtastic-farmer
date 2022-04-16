//
//  ProductCard.swift
//  FarmtasticFarmer
//
//  Created by Trang on 7.4.2022.
//

import SwiftUI

struct ProductResultCard: View {
    let product: Product
    var body: some View {
        HStack {
            
            Image(product.image)
                .resizable()
                .scaledToFit()
                .frame(width: 140, height: 140)
                Spacer()
            VStack(alignment: .center) {
                Text(product.name)
                    .font(.title2)
                    .multilineTextAlignment(.leading)
                    .padding(5)
                Text(product.pricePerUnit)
                    .multilineTextAlignment(.leading)
                Text(product.Category)
                    .multilineTextAlignment(.leading)
            }
            .padding(5.0)
            .frame(width: 140.0, height: 140.0)
        }
        .padding([.leading, .trailing], 20)
    }
}

struct ProductCard_Previews: PreviewProvider {
    static var product = Product.sampleProductsList[0]
    static var previews: some View {
        ProductResultCard(product: product)
            .previewLayout(.fixed(width: 1000, height: 70))
            
    }
}
