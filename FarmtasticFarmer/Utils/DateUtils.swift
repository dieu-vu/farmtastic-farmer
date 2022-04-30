//
//  DateUtils.swift
//  FarmtasticFarmer
//
//  Created by Giang Nguyen on 29.4.2022.
//

import Foundation
import SwiftUI

struct DateUtils {    
    let months: [String] = ["january", "february", "march", "april", "may", "june", "july", "august", "september", "october", "november", "december"]
    let abbrevMonths = ["dummy", "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
    
    init() {}
    
    func getCurrentYear() -> Int {
        return Calendar.current.component(.year, from: Date())
    }
    
    func getCurrentMonthInt() -> Int {
        return Calendar.current.component(.month, from: Date())
    }
    
    func getCurrentMonthString() -> String {
        return months[getCurrentMonthInt() - 1]
    }
    
    func getMonthInt(month: String) -> Int? {
        return months.firstIndex(of: month) 
    }
}
