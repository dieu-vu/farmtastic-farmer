//
//  Language.swift
//  FarmtasticFarmer
//
//  Created by hanghuynh on 7.4.2022.
//

import Foundation

enum Language: String, CaseIterable, Identifiable {
    
    case en = "en", fi = "fi", vi = "vi"
    
    var name: String {
        switch self {
            case .en: return "English"
            case .fi: return "Finnish"
            case .vi: return "Vietnamese"
        }
    }
    
    var id: String {
        name
    }
}
