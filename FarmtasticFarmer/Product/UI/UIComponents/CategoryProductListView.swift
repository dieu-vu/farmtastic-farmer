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
    
    @State var productIsTapped = false
    @Binding var tabSelection: Int
    
    
    var body: some View {
        VStack{
            Text (category)
                .font(.headline)
                .fontWeight(.bold)
                .foregroundColor(.red)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 20)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(products, id: \.product_id) { product in
                        ProductCardView(product: product, tabSelection: $tabSelection)
                    }
                }.padding([.bottom, .leading], 20)
            }
        }
    }
    
    struct CategoryProductListView_Previews: PreviewProvider {
        static var previews: some View {
            let meatProductList = ProductDataController().meatProductList
            CategoryProductListView(
                products: meatProductList,category: "Meat", tabSelection: Binding.constant(Constants.productTab))
        }
    }
}


