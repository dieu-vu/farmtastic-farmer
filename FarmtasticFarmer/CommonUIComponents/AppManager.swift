//
//  AppManager.swift
//  FarmtasticFarmer
//
//  Created by hanghuynh on 12.4.2022.
//

import Foundation
import Combine
import SwiftUI

struct AppManager {
    static let Authenticated = PassthroughSubject<Bool, Never>()
    
    static func isAuthenticated() -> Bool {
        print("Reading token from keychain \(String(data: KeychainHelper.standard.read(service: "auth-token", account: "farmtastic")! , encoding: .utf8))")
        return KeychainHelper.standard.read(service: "auth-token", account: "farmtastic") != nil
    }
}
