//
//  Statistics.swift
//  FarmtasticFarmer
//
//  Created by Giang Nguyen on 28.4.2022.
//

import Foundation
import Charts

struct StatisticsData {
    static var yearlyLineChartData: [BarChartDataEntry] = [
        BarChartDataEntry(x: 1, y: 16105),
        BarChartDataEntry(x: 2, y: 17503),
        BarChartDataEntry(x: 3, y: 15785),
        BarChartDataEntry(x: 4, y: 20233),
        BarChartDataEntry(x: 5, y: 512),
        BarChartDataEntry(x: 6, y: 0),
        BarChartDataEntry(x: 7, y: 0),
        BarChartDataEntry(x: 8, y: 0),
        BarChartDataEntry(x: 9, y: 0),
        BarChartDataEntry(x: 10, y: 0),
        BarChartDataEntry(x: 11, y: 0),
        BarChartDataEntry(x: 12, y: 0),
    ]
    
    static var yearlyPieChartData: [PieChartDataEntry] = [
        PieChartDataEntry(value: 144, label: "Meat"),
        PieChartDataEntry(value: 108, label: "Vegetables"),
        PieChartDataEntry(value: 72, label: "Fruit"),
        PieChartDataEntry(value: 36, label: "Egg & Diary")
    ]
    
    static var monthlyLineChartData: [String: [BarChartDataEntry]] = [
        "march": marchLineChartData,
        "april": aprilLineChartData,
        "may": mayLineChartData
    ]
    
    static var monthlyPieChartData: [String: [PieChartDataEntry]] = [
        "march": marchPieChartData,
        "april": aprilPieChartData,
        "may": mayPieChartData
    ]
    
    static var marchLineChartData: [BarChartDataEntry] = [
        BarChartDataEntry(x: 1, y: 610),
        BarChartDataEntry(x: 2, y: 650),
        BarChartDataEntry(x: 3, y: 578),
        BarChartDataEntry(x: 4, y: 524),
        BarChartDataEntry(x: 5, y: 432),
        BarChartDataEntry(x: 6, y: 324),
        BarChartDataEntry(x: 7, y: 475),
        BarChartDataEntry(x: 8, y: 534),
        BarChartDataEntry(x: 9, y: 345),
        BarChartDataEntry(x: 10, y: 222),
        BarChartDataEntry(x: 11, y: 442),
        BarChartDataEntry(x: 12, y: 579),
        BarChartDataEntry(x: 13, y: 305),
        BarChartDataEntry(x: 14, y: 303),
        BarChartDataEntry(x: 15, y: 785),
        BarChartDataEntry(x: 16, y: 833),
        BarChartDataEntry(x: 17, y: 928),
        BarChartDataEntry(x: 18, y: 363),
        BarChartDataEntry(x: 19, y: 657),
        BarChartDataEntry(x: 20, y: 540),
        BarChartDataEntry(x: 21, y: 353),
        BarChartDataEntry(x: 22, y: 428),
        BarChartDataEntry(x: 23, y: 442),
        BarChartDataEntry(x: 24, y: 679),
        BarChartDataEntry(x: 25, y: 605),
        BarChartDataEntry(x: 26, y: 603),
        BarChartDataEntry(x: 27, y: 385),
        BarChartDataEntry(x: 28, y: 433),
        BarChartDataEntry(x: 29, y: 228),
        BarChartDataEntry(x: 30, y: 543),
        BarChartDataEntry(x: 31, y: 457),
    ]
    
    static var aprilLineChartData: [BarChartDataEntry] = [
        BarChartDataEntry(x: 1, y: 710),
        BarChartDataEntry(x: 2, y: 650),
        BarChartDataEntry(x: 3, y: 626),
        BarChartDataEntry(x: 4, y: 924),
        BarChartDataEntry(x: 5, y: 832),
        BarChartDataEntry(x: 6, y: 924),
        BarChartDataEntry(x: 7, y: 775),
        BarChartDataEntry(x: 8, y: 534),
        BarChartDataEntry(x: 9, y: 1145),
        BarChartDataEntry(x: 10, y: 1022),
        BarChartDataEntry(x: 11, y: 742),
        BarChartDataEntry(x: 12, y: 979),
        BarChartDataEntry(x: 13, y: 505),
        BarChartDataEntry(x: 14, y: 503),
        BarChartDataEntry(x: 15, y: 785),
        BarChartDataEntry(x: 16, y: 633),
        BarChartDataEntry(x: 17, y: 628),
        BarChartDataEntry(x: 18, y: 363),
        BarChartDataEntry(x: 19, y: 657),
        BarChartDataEntry(x: 20, y: 540),
        BarChartDataEntry(x: 21, y: 353),
        BarChartDataEntry(x: 22, y: 428),
        BarChartDataEntry(x: 23, y: 442),
        BarChartDataEntry(x: 24, y: 679),
        BarChartDataEntry(x: 25, y: 605),
        BarChartDataEntry(x: 26, y: 603),
        BarChartDataEntry(x: 27, y: 385),
        BarChartDataEntry(x: 28, y: 533),
        BarChartDataEntry(x: 29, y: 528),
        BarChartDataEntry(x: 30, y: 543),
        BarChartDataEntry(x: 31, y: 457),
    ]
    
    static var mayLineChartData: [BarChartDataEntry] = [
        BarChartDataEntry(x: 1, y: 190),
        BarChartDataEntry(x: 2, y: 143),
        BarChartDataEntry(x: 3, y: 179),
    ]
    
    static var marchPieChartData: [PieChartDataEntry] = [
        PieChartDataEntry(value: 90, label: "Meat"),
        PieChartDataEntry(value: 124, label: "Vegetables"),
        PieChartDataEntry(value: 96, label: "Fruit"),
        PieChartDataEntry(value: 50, label: "Egg & Diary")
    ]
    
    static var aprilPieChartData: [PieChartDataEntry] = [
        PieChartDataEntry(value: 100, label: "Meat"),
        PieChartDataEntry(value: 104, label: "Vegetables"),
        PieChartDataEntry(value: 100, label: "Fruit"),
        PieChartDataEntry(value: 56, label: "Egg & Diary")
    ]
    
    static var mayPieChartData: [PieChartDataEntry] = [
        PieChartDataEntry(value: 180, label: "Meat"),
        PieChartDataEntry(value: 180, label: "Vegetables"),
        PieChartDataEntry(value: 0, label: "Fruit"),
        PieChartDataEntry(value: 0, label: "Egg & Diary")
    ]
}
