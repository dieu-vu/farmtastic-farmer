//
//  LanguagePicker.swift
//  FarmtasticFarmer
//
//  Created by hanghuynh on 7.4.2022.
//

import SwiftUI

struct LanguagePicker: View {
    @State private var languagePrefix = Locale.preferredLanguages[0].split(separator: "-")[0]
    @State var selectedLanguage: Language = .en
    @Binding var showLanguageBottomSheet: Bool
    
//    private let isLanguageAvailable: Int = Language.allCases.filter{ $0.rawValue == languagePrefix }.count
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Change Language").font(.title).fontWeight(.bold).padding(.bottom, 32)
                List {
                    ForEach(Language.allCases) { language in
                        LanguageView(language: language, selectedLanguage:  $selectedLanguage)
                           
                    }
                }.listStyle(.inset).frame(height: 150)
                ButtonView(buttonText: "Apply", buttonColorLight: "LightGreen", buttonColorDark: "DarkGreen", buttonAction: { showLanguageBottomSheet.toggle() })
            }
        }
    }
}

struct LanguagePicker_Previews: PreviewProvider {
    static var previews: some View {
        LanguagePicker(showLanguageBottomSheet: .constant(false))
    }
}


