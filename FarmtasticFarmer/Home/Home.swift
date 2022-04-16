//
//  Home.swift
//  FarmtasticFarmer
//
//  Created by Nguyen Giang on 7.4.2022.
//

import SwiftUI

struct Home: View {
    @AppStorage("language")
    private var language = LocalizationService.shared.language
    
    var body: some View {
        ZStack {
            Color("AppBackground")
                .ignoresSafeArea()
            Text("home".localized(language: language))
        }
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
