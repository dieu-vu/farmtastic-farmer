//
//  ProductMainScreen.swift
//  FarmtasticFarmer
//
//  Created by Nguyen Giang on 11.4.2022.
//

import SwiftUI

struct ProductMainScreen: View {
    var body: some View {
        ZStack {
            Color("AppBackground")
                .ignoresSafeArea()
            Text("Product")
        }
    }
}

struct ProductMainScreen_Previews: PreviewProvider {
    static var previews: some View {
        ProductMainScreen()
    }
}
