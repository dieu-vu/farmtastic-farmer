//
//  CategoryProductListView.swift
//  FarmtasticFarmer
//
//  Created by Trang on 12.4.2022.
//  Struct to handle Category product List View in Main product screen

import SwiftUI

struct CategoryProductListView: View {
    let products: [ProductFetched]
    let category: String
    
    @EnvironmentObject var productDataController: ProductDataController

    var body: some View {
        VStack{
            Text (category)
                .font(.headline)
                .fontWeight(.bold)
                .foregroundColor(.red)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 20)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack{
                    ForEach(products, id: \.product_id) { product in
                        ProductCardView(product: product).padding([.horizontal, .bottom], 10)
                    }
                }.padding([.horizontal, .bottom], 10)
            }
        }
        .onAppear{
            productDataController.loadProducts {
                result in
                switch result {
                case .success(let products):
                    productDataController.products = products
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
}

struct CategoryProductListView_Previews: PreviewProvider {
    static var previews: some View {
        let meatProductList = ProductDataController().meatProductList
        CategoryProductListView(
            products: meatProductList,category: "Meat")
    }
}


