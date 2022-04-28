//
//  ProductCardView.swift
//  FarmtasticFarmer
//
//  Created by Dieu Vu on 4/28/22.
//

import SwiftUI

struct ProductCardView : View {
    let product: ProductFetched
    let placeholderImageData = UIImage(imageLiteralResourceName: "placeholder").jpegData(compressionQuality: 0.5)
    
    @State var productIsTapped = false

    var body: some View {
        VStack{
            Image(uiImage: UIImage(data: product.image ?? placeholderImageData!)!)
                .resizable()
                .scaledToFit()
                .frame(width: 90, height: 90)
            Text(product.product_name ?? "")
                .font(.title2)
                .multilineTextAlignment(.leading)
            Text("\(product.unit_price, specifier: "%.2f") €/\(product.unit ?? "")")
                .multilineTextAlignment(.leading)
        }.frame(width: 150, height: 150)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.green, lineWidth: 1)
            )
            .onTapGesture {
                // Navigate to detail view
                productIsTapped.toggle()
                print("tapped \(String(describing: product.product_name))")
            }
        NavigationLink("", destination: ProductDetailView(product: product).navigationBarBackButtonHidden(true), isActive: $productIsTapped)

    }
    
}



//
//struct ProductCardView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProductCardView()
//    }
//}
