//
//  ProductCardView.swift
//  FarmtasticFarmer
//
//  Created by Dieu Vu on 4/28/22.
//  UI component for each product on the main Product view

import SwiftUI

struct ProductCardView : View {
    let product: ProductFetched
    let placeholderImageData = UIImage(imageLiteralResourceName: "placeholder").jpegData(compressionQuality: 0.5)
    
    @State var productIsTapped = false
    @Binding var tabSelection: Int

    
    var body: some View {
        VStack {
            Image(uiImage: UIImage(data: product.image ?? placeholderImageData!)!)
                .resizable()
                .scaledToFit()
                .frame(width: 90, height: 90)
            Text(product.product_name ?? "")
                .font(.caption)
                .bold()
                .multilineTextAlignment(.leading)
            Text("\(product.unit_price, specifier: "%.2f") €/\(product.unit ?? "")")
                .font(.headline)
                .multilineTextAlignment(.leading)
        }.frame(width: 170, height: 170)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.green, lineWidth: 1)
            )
            .onTapGesture {
                // Navigate to detail view
                productIsTapped.toggle()
                print("tapped \(String(describing: product.product_name))")
            }

        NavigationLink("", destination: ProductDetailView(product: product, tabSelection: $tabSelection).navigationBarBackButtonHidden(true), isActive: $productIsTapped)
    }
    
}



//
//struct ProductCardView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProductCardView()
//    }
//}
