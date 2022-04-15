//
//  Utils.swift
//  FarmtasticFarmer
//
//  Created by Dieu Vu on 4/15/22.
//

import Foundation

class Utils {
    static let utils = Utils()
    private init() {}
    
//   Preprocess nested json
    func preProcessJson(_ data:Data) -> Data {
        let jsonString = String(decoding: data, as: UTF8.self)
        let cleanedJson = jsonString
            .replacingOccurrences(of: "\\", with: "")
            .replacingOccurrences(of: "\"{", with: "{")
            .replacingOccurrences(of: "}\"", with: "}")
        return cleanedJson.data(using: .utf8)!
    }
}
