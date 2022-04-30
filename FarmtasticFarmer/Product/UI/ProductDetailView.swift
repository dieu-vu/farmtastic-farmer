//
//  ProductDetailView.swift
//  FarmtasticFarmer
//
//  Created by Trang on 8.4.2022.
//  Struct for Product detail UI

import SwiftUI

struct ProductDetailView: View {
    let product: ProductFetched
    @Binding var tabSelection: Int
   
    @EnvironmentObject var productDataController: ProductDataController
   
    @State var navigateToUpdateProduct: Bool = false
    @State var navigateToMainList: Bool = false
    
    let placeholderImageData = UIImage(imageLiteralResourceName: "placeholder").jpegData(compressionQuality: 0.5)

    var body: some View {
        VStack {
            ScreenLayout(screenTitle: "product.details", hasBackButton: true)
            
            ScrollView {
                Image (uiImage: UIImage(data: product.image ?? placeholderImageData!)!)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 200)
                HStack {
                    Text (product.product_name ?? "")
                        .font(.headline)
                        .fontWeight(.bold)
                        .padding()
                }

                VStack(alignment: .leading) {
                    Text ("Available quantity: \(product.selling_quantity, specifier: "%.2f")kg")
                        .multilineTextAlignment(.leading)
                        .padding(.bottom, 5)
                    Text ("Price: \(product.unit_price, specifier: "%.2f") €/\(product.unit ?? "")")
                        .multilineTextAlignment(.leading)
                        .padding(.bottom, 5)
                    Text ("Category: \(product.category ?? "")" )
                        .multilineTextAlignment(.leading)
                        .padding(.bottom, 5)
                    Text ("Harvest date: \(Utils.utils.formatDateString(product.harvest_date ?? Date()))")
                        .multilineTextAlignment(.leading)
                        .padding(.bottom, 5)
                }
                .frame(width: 300).navigationBarHidden(true)
                
                HStack {
                    VStack {
                        ButtonView(buttonText: "Update",
                                   buttonColorLight: "LightGreen",
                                   buttonColorDark: "DarkGreen",
                                   buttonAction: {navigateToUpdateProduct = true})
                        NavigationLink("", destination: ProductAddScreen(tabSelection: $tabSelection, isUpdating: true, productId: Int(product.product_id)), isActive: $navigateToUpdateProduct)
                    }
                    VStack{
                    ButtonView(buttonText: "Delete",
                               buttonColorLight: "PinkishRed",
                               buttonColorDark: "PinkishRed",
                               buttonAction: {
                        productDataController.deleteProduct(productId: Int(product.product_id))
                        navigateToMainList = true
                        print("Button clicked")
                        
                    })
                        NavigationLink("", destination: ProductMainScreen(tabSelection: $tabSelection, products: productDataController.allProducts), isActive: $navigateToMainList)
                    }
                }
                .padding(.horizontal, 4)
            }
        }
    }
}

//struct ProductDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProductDetailView()
//    }
//}
