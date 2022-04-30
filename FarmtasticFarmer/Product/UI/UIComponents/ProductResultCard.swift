//
//  ProductCard.swift
//  FarmtasticFarmer
//
//  Created by Trang on 7.4.2022.
//  UI for item in the list of search product results

import SwiftUI

struct ProductResultCard: View {
    let product: ProductFetched
    let placeholderImageData = UIImage(imageLiteralResourceName: "placeholder").jpegData(compressionQuality: 0.5)
    @State var productIsTapped = false
    @Binding var tabSelection: Int

    
    var body: some View {
        HStack {
            
            Image(uiImage: UIImage(data: product.image ?? placeholderImageData!)!)
                .resizable()
                .scaledToFit()
                .frame(width: 140, height: 140)
            Spacer()
            VStack(alignment: .center) {
                Text(product.product_name ?? "")
                    .font(.title2)
                    .multilineTextAlignment(.leading)
                    .padding(5)
                Text("\(product.unit_price, specifier: "%.2f") €/\(product.unit ?? "")")
                    .multilineTextAlignment(.leading)
                Text("\(product.category ?? "") ")
                    .multilineTextAlignment(.leading)
            }
            .padding(5.0)
            .frame(width: 140.0, height: 140.0)
        }
        .padding([.leading, .trailing], 20)
        .onTapGesture {
            // Navigate to detail view
            productIsTapped.toggle()
            print("tapped \(String(describing: product.product_name))")
        }
        NavigationLink("", destination: ProductDetailView(product: product, tabSelection: $tabSelection).navigationBarBackButtonHidden(true), isActive: $productIsTapped)
        
    }
}

//struct ProductCard_Previews: PreviewProvider {
//    static var product = ProductDataController().allProducts[0]
//    static var previews: some View {
//        ProductResultCard(product: product)
//            .previewLayout(.sizeThatFits)
//
//    }
//}
