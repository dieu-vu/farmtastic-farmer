//
//  ProductDetailView.swift
//  FarmtasticFarmer
//
//  Created by Trung on 8.4.2022.
//

import SwiftUI

struct ProductDetailView: View {
    let product: ProductFetched
    @State var screenTitle = "product.details"
    @State var hasBackButton = true
    let placeholderImageData = UIImage(imageLiteralResourceName: "placeholder").jpegData(compressionQuality: 0.5)
    
    var body: some View {
        
        VStack {
           ScreenLayout(screenTitle: $screenTitle, hasBackButton: $hasBackButton)
        
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
                    
//                    Image(systemName: "pencil")
//                        .aspectRatio(contentMode: .fit)
//                        .foregroundColor(Color.black)
                }
                // TODO: deducting sold quantity here
                VStack(alignment: .leading) {
                    Text ("Available quantity: \(product.selling_quantity, specifier: "%.2f")kg")
                        .multilineTextAlignment(.leading)
                        .padding(.bottom, 5)
                    Text ("Price: \(product.unit_price, specifier: "%.2f") €/kg")
                        .multilineTextAlignment(.leading)
                        .padding(.bottom, 5)
                    Text ("Category: \(product.category ?? "") " )
                        .multilineTextAlignment(.leading)
                        .padding(.bottom, 5)
                    Text ("Harvest date: \(Utils.utils.formatDateString(product.harvest_date ?? Date()))")
                        .multilineTextAlignment(.leading)
                        .padding(.bottom, 5)
                }
                .frame(width: 300)
               
                ButtonView(buttonText: "Delete", buttonColorLight: "PinkishRed", buttonColorDark: "PinkishRed", buttonAction: {print("Button clicked")}).padding(.top, 30)
            }
        }
    }
}

//struct ProductDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProductDetailView()
//    }
//}
