//
//  ProductMainScreen.swift
//  FarmtasticFarmer
//
//  Created by Nguyen Giang on 11.4.2022.
//

import SwiftUI

struct ProductMainScreen: View {
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

struct ProductMainScreen_Previews: PreviewProvider {
    static var previews: some View {
        ProductMainScreen()
    }
}
