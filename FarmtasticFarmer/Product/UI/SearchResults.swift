//
//  SearchResults.swift
//  FarmtasticFarmer
//
//  Created by Trang on 7.4.2022.
//  Struct to handle search result list view

import SwiftUI
struct SearchResults: View {
    @AppStorage("language")
    private var language = LocalizationService.shared.language
    @State var searchText: String
    @State var screenTitle: String = "product.searchResults"
    @EnvironmentObject var productDataController: ProductDataController
    @Binding var tabSelection: Int
    
    var body: some View {
        VStack {
            ScreenLayout(screenTitle: "product.searchResults", hasBackButton: true, subTitle: "\(searchText)", text: "\(productDataController.searchResultProductList.count) results")
            
            List{
                VStack {
                    ForEach(productDataController.searchResultProductList, id: \.product_id) { product in
                        ZStack{
                            ProductResultCard(product: product, tabSelection: $tabSelection)}
                        Divider()
                    }
                }
                .padding(.bottom, 10)
            }
        }
        .navigationBarHidden(true)
    }
}

struct SearchResults_Previews: PreviewProvider {
    static var previews: some View {
        SearchResults(searchText:"", tabSelection: Binding.constant(Constants.productTab))
    }
}
