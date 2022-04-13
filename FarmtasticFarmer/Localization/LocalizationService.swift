//
//  LocalizationService.swift
//  FarmtasticFarmer
//
//  Created by Nguyen Giang on 13.4.2022.
//  Source: https://medium.com/swlh/swiftui-localization-on-the-fly-2312fde49459

import Foundation

class LocalizationService {
    static let shared = LocalizationService()
    static let selectedLanguage = Notification.Name("selectedLanguage")
    
    private init() {}
    
    var language: Language {
        get {
            // get language in UserDefaults and return language in UserDefaults if there is
            guard let languageString = UserDefaults.standard.string(forKey: "language") else {
                // get phone language and return phone language if there is
                guard let phoneLanguage = NSLocale.current.languageCode else {
                    // else always fallback to English
                    return .en
                }
                return Language(rawValue: phoneLanguage) ?? .en
            }
            return Language(rawValue: languageString) ?? .en
        } set {
            if newValue != language {
                UserDefaults.standard.setValue(newValue.rawValue, forKey: "language")
                NotificationCenter.default.post(name: LocalizationService.selectedLanguage, object: nil)
            }
        }
    }
}

extension String {
    func localized(language: Language) -> String {
        let path = Bundle.main.path(forResource: language.rawValue, ofType: "lproj")
        let bundle: Bundle
        if let path = path {
            bundle = Bundle(path: path) ?? .main
        } else {
            bundle = .main
        }
        return NSLocalizedString(self, tableName: nil, bundle: bundle, value: "", comment: "")
    }
    
}
