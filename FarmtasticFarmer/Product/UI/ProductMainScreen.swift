//
//  ProductMainScreen.swift
//  FarmtasticFarmer
//
//  Created by Nguyen Giang on 11.4.2022.
//

import SwiftUI

struct ProductMainScreen: View {
    let products: [Product]
    @State var searchText = ""
    @State var searching = false
    
    @State var navigateToAddProduct: Bool = false
    
    
    let meatProductList = Product.sampleProductsList.filter {
        $0.Category.starts(with: "Meat")
    }
    let vegeProductList = Product.sampleProductsList.filter {
        $0.Category.starts(with: "Vegetables")
    }
    let fruitProductList = Product.sampleProductsList.filter {
        $0.Category.starts(with: "Fruit")
    }
    
    var body: some View {
        
        VStack(alignment: .center) {
            Text("All Categories")
                .font(.headline)
                .fontWeight(.bold)
            
            SearchBar(searchText: $searchText, searching: $searching)
            ScrollView {
                VStack{
                    CategoryProductListView(products: meatProductList, category: "Meat")
                    CategoryProductListView(products: vegeProductList, category: "Vegetables")
                    CategoryProductListView(products: fruitProductList, category: "Fruit")
                }
                NavigationLink(destination: ProductAddScreen(), isActive: $navigateToAddProduct){
            }
           
        }
        .toolbar {
            if searching {
                Button("Cancel") {
                    searchText = ""
                    withAnimation {
                        searching = false
                        UIApplication.shared.dismissKeyboard()
                    }
                }
            }
        }
        .gesture(DragGesture()
                    .onChanged({ _ in
            UIApplication.shared.dismissKeyboard()
        })
        )
        .floatingActionButton(color: Color("LightYellow"),
                              image: Image(systemName: "plus").foregroundColor(.black)){
            navigateToAddProduct = true
        }}
    }
    
}

struct ProductMainScreen_Previews: PreviewProvider {
    static var previews: some View {
        ProductMainScreen(products: Product.sampleProductsList)
    }
}

extension UIApplication {
    func dismissKeyboard() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
