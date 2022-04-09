//
//  LanguageView.swift
//  FarmtasticFarmer
//
//  Created by hanghuynh on 7.4.2022.
//

import SwiftUI

struct LanguageView: View {
    let language: Language
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 4)
                .fill(Color.white)
            Text(language.name)
                .padding(4)
        }
        .fixedSize(horizontal: false, vertical: true)
    }
}

struct LanguageView_Previews: PreviewProvider {
    static var previews: some View {
        LanguageView(language: .english)
    }
}
