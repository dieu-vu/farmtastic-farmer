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
    func preProcessJson(_ data: Data) -> Data {
        let jsonString = String(decoding: data, as: UTF8.self)
        let cleanedJson = jsonString
            .replacingOccurrences(of: "\\", with: "")
            .replacingOccurrences(of: "\"{", with: "{")
            .replacingOccurrences(of: "}\"", with: "}")
        return cleanedJson.data(using: .utf8)!
    }
    
    // Convert dateString from API to ISODateFormat to save into Coredata
    func convertDateFromApi(_ timeStr: String) -> Date {
        let date = ISO8601DateFormatter().date(from: timeStr) ?? Date()
        return date
    }
    
    // Convert data to ISODateFormat String to post to API
    func convertDateToISOString(_ date: Date) -> String {
        let ISOString = ISO8601DateFormatter().string(from: date)
        return ISOString
    }
    
    
    // Convert ISO date to string dd-MM-yyyy
    func formatDateString(_ dateObj: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        dateFormatter.locale = Locale(identifier: "fi_FI")
        dateFormatter.timeZone = TimeZone(identifier: "Europe/Helsinki")
        let dateFormatted = dateFormatter.string(from: dateObj)
        return dateFormatted
    }
    
    func getDateComponents(_ dateObj: Date) -> DateComponents {
        return Calendar.current.dateComponents([.year, .month, .day], from: dateObj)
    }
}
