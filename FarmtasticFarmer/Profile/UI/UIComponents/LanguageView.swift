//
//  LanguageView.swift
//  FarmtasticFarmer
//
//  Created by hanghuynh on 7.4.2022.
//

import SwiftUI

struct LanguageView: View {
    let language: Language
    @Binding var selectedLanguage: Language 
    
    var body: some View {
        HStack {
            Text(language.name)
                .padding(4)
            Spacer()
            if selectedLanguage == language {
                Image(systemName: "checkmark.circle").foregroundColor(Color("DarkGreen"))
            }
        }
        .fixedSize(horizontal: false, vertical: true)
        .onTapGesture {
            let languagePrefix = Locale.preferredLanguages[0].split(separator: "-")[0]
            print(languagePrefix)
           //print(language)
            selectedLanguage = language
        }
    }
}

struct LanguageView_Previews: PreviewProvider {
    static var previews: some View {
        LanguageView(language: .en, selectedLanguage: .constant(.en))
    }
}
