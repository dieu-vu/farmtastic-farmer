//
//  LanguagePicker.swift
//  FarmtasticFarmer
//
//  Created by hanghuynh on 7.4.2022.
//  UI component for the language picker inside language view

import SwiftUI

struct LanguagePicker: View {
    @AppStorage("language")
    private var language = LocalizationService.shared.language
    @State var selectedLanguage: Language = LocalizationService.shared.language
    @Binding var showLanguageBottomSheet: Bool
    
    var body: some View {
        NavigationView {
            VStack {
                Text("profile.changeLanguage".localized(language: language)).font(.title).fontWeight(.bold).padding(.bottom, 32)
                List {
                    ForEach(Language.allCases) { language in
                        LanguageView(language: language, selectedLanguage:  $selectedLanguage)
                           
                    }
                }.listStyle(.inset).frame(height: 150)
                ButtonView(buttonText: "apply".localized(language: language), buttonColorLight: "LightGreen", buttonColorDark: "DarkGreen", buttonAction: {
                    LocalizationService.shared.language = selectedLanguage
                    showLanguageBottomSheet.toggle() })
            }
        }
    }
}

struct LanguagePicker_Previews: PreviewProvider {
    static var previews: some View {
        LanguagePicker(showLanguageBottomSheet: .constant(false))
    }
}


