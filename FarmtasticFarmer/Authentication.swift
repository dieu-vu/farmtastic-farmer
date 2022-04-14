//
//  AppManager.swift
//  FarmtasticFarmer
//
//  Created by hanghuynh on 12.4.2022.
//

import SwiftUI

class Authentication: ObservableObject {
    
    @Published var isAuthenticated = false
    
    func updatedAuthentication(success: Bool) {
            isAuthenticated = success
        }
}
