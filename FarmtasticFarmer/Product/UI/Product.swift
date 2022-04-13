//
//  Product.swift
//  FarmtasticFarmer
//
//  Created by Nguyen Giang on 7.4.2022.
//

import SwiftUI

struct Product: View {
    @AppStorage("language")
    private var language = LocalizationService.shared.language
    
    var body: some View {
        ZStack {
            Color("AppBackground")
                .ignoresSafeArea()
            Text("product".localized(language: language))
        }
    }
}

struct Product_Previews: PreviewProvider {
    static var previews: some View {
        Product()
    }
}
