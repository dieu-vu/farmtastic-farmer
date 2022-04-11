//
//  ProductDetailView.swift
//  FarmtasticFarmer
//
//  Created by Trung on 8.4.2022.
//

import SwiftUI

struct ProductDetailView: View {
    //let product: ProductList
    
    var body: some View {
        
        VStack {
            Text ("Product details")
            .font(.headline)
            .fontWeight(.bold)
        
            ScrollView {
                Image ("Entrecote")
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
               
                Button(action: {}) {
                    Text("Delete")
                        .font(.headline)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.red)
                        .cornerRadius(15.0)
                }.padding(.top, 50)
            }
        }
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView()
    }
}
