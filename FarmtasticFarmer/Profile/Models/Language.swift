//
//  Language.swift
//  FarmtasticFarmer
//
//  Created by hanghuynh on 7.4.2022.
//

import Foundation

enum Language: String, CaseIterable, Identifiable {
    
    case english, finnish, vietnamese
    
    var name: String {
        rawValue.capitalized
    }
    
    var id: String {
        name
    }
}
