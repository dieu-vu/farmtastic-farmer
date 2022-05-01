//
//  DateUtils.swift
//  FarmtasticFarmer
//
//  Created by Giang Nguyen on 29.4.2022.
//

import Foundation
import SwiftUI

//a helper to display current month and year on statistics screen
struct DateUtils {    
    let months: [String] = ["january", "february", "march", "april", "may", "june", "july", "august", "september", "october", "november", "december"]
    
    /* this array is used to display on xAxis of line chart
       but due to the opening issue of this chart package,
       there should be a 'dummy' word at index 0 of the array */
    let abbrevMonths = ["dummy", "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
    
    init() {}
    
    //get current year
    func getCurrentYear() -> Int {
        return Calendar.current.component(.year, from: Date())
    }
    
    //get the index of the current month
    func getCurrentMonthInt() -> Int {
        return Calendar.current.component(.month, from: Date())
    }
    
    //get the current in string, ex. "January"
    func getCurrentMonthString() -> String {
        return months[getCurrentMonthInt() - 1]
    }
    
    //get the index of the month passed as parameter
    func getMonthInt(month: String) -> Int? {
        return months.firstIndex(of: month) 
    }
}
