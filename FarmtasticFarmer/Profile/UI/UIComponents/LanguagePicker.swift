//
//  LanguagePicker.swift
//  FarmtasticFarmer
//
//  Created by hanghuynh on 7.4.2022.
//  UI component for the language picker inside language view

import SwiftUI

struct LanguagePicker: View {
    @State var selectedLanguage: Language = LocalizationService.shared.language
    @Binding var showLanguageBottomSheet: Bool
    
    var body: some View {
        NavigationView {
            VStack {
                Text(Translation().ChangeLanguage).font(.title).fontWeight(.bold).padding(.bottom, 32)
                List {
                    ForEach(Language.allCases) { language in
                        LanguageView(language: language, selectedLanguage:  $selectedLanguage)
                           
                    }
                }
                .listStyle(.inset)
                .frame(height: 150)
                ButtonView(buttonText: Translation().Apply, buttonColorLight: "LightGreen", buttonColorDark: "DarkGreen", buttonAction: {
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


