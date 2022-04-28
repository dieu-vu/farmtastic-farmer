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
    
    var body: some View {
        
        VStack {
           ScreenLayout(screenTitle: $screenTitle, hasBackButton: $hasBackButton)
        
            ScrollView {
                Image ("entrecote")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 200)
                HStack {
                    Text ("Fresh entrecote cut")
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .padding()
                    
                    Image(systemName: "pencil")
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(Color.black)
                        
                }
                
                VStack(alignment: .leading) {
                    Text ("Quantity: 100kg")
                        .multilineTextAlignment(.leading)
                        .padding(.bottom, 5)
                    Text ("Price: 18€/kg")
                        .multilineTextAlignment(.leading)
                        .padding(.bottom, 5)
                    Text ("Category: Beef")
                        .multilineTextAlignment(.leading)
                        .padding(.bottom, 5)
                    Text ("Harvest date: 23/2/2022")
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
