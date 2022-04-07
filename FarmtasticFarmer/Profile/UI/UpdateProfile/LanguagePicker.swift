//
//  LanguagePicker.swift
//  FarmtasticFarmer
//
//  Created by hanghuynh on 7.4.2022.
//

import SwiftUI

struct LanguagePicker: View {
    
    @Binding var selectedLanguage: Language
    
    var body: some View {
        List {
            Picker("Language", selection: $selectedLanguage) {
                ForEach(Language.allCases) { language in
                    LanguageView(language: language)
                        .tag(language)
                }
            }
        }
    }
}

struct LanguagePicker_Previews: PreviewProvider {
    static var previews: some View {
        LanguagePicker(selectedLanguage: .constant(.english))
    }
}


