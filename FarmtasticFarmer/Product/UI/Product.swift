//
//  Product.swift
//  FarmtasticFarmer
//
//  Created by Nguyen Giang on 7.4.2022.
//

import SwiftUI

struct Product: View {
    var body: some View {
        ZStack {
            Color("AppBackground")
                .ignoresSafeArea()
            Text("Product")
        }
    }
}

struct Product_Previews: PreviewProvider {
    static var previews: some View {
        Product()
    }
}
