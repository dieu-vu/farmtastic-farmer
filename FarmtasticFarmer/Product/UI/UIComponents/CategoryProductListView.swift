//
//  CategoryProductListView.swift
//  FarmtasticFarmer
//
//  Created by Trung on 12.4.2022.
//

import SwiftUI

struct CategoryProductListView: View {
    let products: [Product]
    let category: String
    var body: some View {
        VStack{
            Text (category)
                .font(.headline)
                .fontWeight(.bold)
                .foregroundColor(.red)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(4)
            
            ScrollView(.horizontal, showsIndicators: false){
                HStack{
                    ForEach(products, id: \.name) { product in
                        productCardView(product: product).padding(6)
                    }
                }
            }
        }
        .padding(.horizontal, 8)
    }
}

struct CategoryProductListView_Previews: PreviewProvider {
    static var previews: some View {
        let meatProductList = Product.sampleProductsList.filter {
            $0.Category.starts(with: "Meat")
        }
        CategoryProductListView(
            products: meatProductList
            ,category:meatProductList[0].Category)
    }
}

struct productCardView : View {
    let product: Product
    var body: some View {
        VStack{
            Image(product.image)
                .resizable()
                .scaledToFit()
                .frame(width: 90, height: 90)
            Text(product.name)
                .font(.title2)
                .multilineTextAlignment(.leading)
            Text(product.pricePerUnit)
                .multilineTextAlignment(.leading)
        }.frame(width: 150, height: 150)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.green, lineWidth: 1)
            )
        
    }
}

