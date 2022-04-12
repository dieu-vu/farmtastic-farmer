//
//  ProductMainScreen.swift
//  FarmtasticFarmer
//
//  Created by Nguyen Giang on 11.4.2022.
//
import SwiftUI

struct ProductScreen: View {
    var body: some View {
        ZStack {
            Color("AppBackground")
                .ignoresSafeArea()
            Text("Product")
        }
    }
}

struct ProductScreen_Previews: PreviewProvider {
    static var previews: some View {
        ProductScreen()
    }
}
