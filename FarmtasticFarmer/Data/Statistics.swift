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
        PieChartDataEntry(value: 144, label: Translation().Meat),
        PieChartDataEntry(value: 108, label: Translation().Vegetables),
        PieChartDataEntry(value: 72, label: Translation().Fruit),
        PieChartDataEntry(value: 36, label: Translation().EggDairy)
    ]
    
    static var monthlyLineChartData: [String: [BarChartDataEntry]] = [
        "january": januaryLineChartData,
        "february": februaryLineChartData,
        "march": marchLineChartData,
        "april": aprilLineChartData,
        "may": mayLineChartData
    ]
    
    static var monthlyPieChartData: [String: [PieChartDataEntry]] = [
        "january": januaryPieChartData,
        "february": februaryPieChartData,
        "march": marchPieChartData,
        "april": aprilPieChartData,
        "may": mayPieChartData
    ]
    
    static var januaryLineChartData: [BarChartDataEntry] = [
        BarChartDataEntry(x: 1, y: 396),
        BarChartDataEntry(x: 2, y: 594),
        BarChartDataEntry(x: 3, y: 595),
        BarChartDataEntry(x: 4, y: 385),
        BarChartDataEntry(x: 5, y: 385),
        BarChartDataEntry(x: 6, y: 594),
        BarChartDataEntry(x: 7, y: 896),
        BarChartDataEntry(x: 8, y: 885),
        BarChartDataEntry(x: 9, y: 721),
        BarChartDataEntry(x: 10, y: 234),
        BarChartDataEntry(x: 11, y: 343),
        BarChartDataEntry(x: 12, y: 532),
        BarChartDataEntry(x: 13, y: 325),
        BarChartDataEntry(x: 14, y: 523),
        BarChartDataEntry(x: 15, y: 234),
        BarChartDataEntry(x: 16, y: 432),
        BarChartDataEntry(x: 17, y: 532),
        BarChartDataEntry(x: 18, y: 531),
        BarChartDataEntry(x: 19, y: 322),
        BarChartDataEntry(x: 20, y: 324),
        BarChartDataEntry(x: 21, y: 684),
        BarChartDataEntry(x: 22, y: 427),
        BarChartDataEntry(x: 23, y: 545),
        BarChartDataEntry(x: 24, y: 545),
        BarChartDataEntry(x: 25, y: 492),
        BarChartDataEntry(x: 26, y: 324),
        BarChartDataEntry(x: 27, y: 292),
        BarChartDataEntry(x: 28, y: 778),
        BarChartDataEntry(x: 29, y: 754),
        BarChartDataEntry(x: 30, y: 784),
        BarChartDataEntry(x: 31, y: 697),
    ]
    
    //17503
    static var februaryLineChartData: [BarChartDataEntry] = [
        BarChartDataEntry(x: 1, y: 396),
        BarChartDataEntry(x: 2, y: 594),
        BarChartDataEntry(x: 3, y: 595),
        BarChartDataEntry(x: 4, y: 570),
        BarChartDataEntry(x: 5, y: 585),
        BarChartDataEntry(x: 6, y: 794),
        BarChartDataEntry(x: 7, y: 896),
        BarChartDataEntry(x: 8, y: 885),
        BarChartDataEntry(x: 9, y: 721),
        BarChartDataEntry(x: 10, y: 542),
        BarChartDataEntry(x: 11, y: 543),
        BarChartDataEntry(x: 12, y: 532),
        BarChartDataEntry(x: 13, y: 325),
        BarChartDataEntry(x: 14, y: 523),
        BarChartDataEntry(x: 15, y: 234),
        BarChartDataEntry(x: 16, y: 432),
        BarChartDataEntry(x: 17, y: 532),
        BarChartDataEntry(x: 18, y: 531),
        BarChartDataEntry(x: 19, y: 322),
        BarChartDataEntry(x: 20, y: 324),
        BarChartDataEntry(x: 21, y: 684),
        BarChartDataEntry(x: 22, y: 427),
        BarChartDataEntry(x: 23, y: 545),
        BarChartDataEntry(x: 24, y: 545),
        BarChartDataEntry(x: 25, y: 492),
        BarChartDataEntry(x: 26, y: 324),
        BarChartDataEntry(x: 27, y: 592),
        BarChartDataEntry(x: 28, y: 778),
        BarChartDataEntry(x: 29, y: 754),
        BarChartDataEntry(x: 30, y: 784),
        BarChartDataEntry(x: 31, y: 697),
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
    
    static var januaryPieChartData: [PieChartDataEntry] = [
        PieChartDataEntry(value: 82, label: Translation().Meat),
        PieChartDataEntry(value: 123, label: Translation().Vegetables),
        PieChartDataEntry(value: 96, label: Translation().Fruit),
        PieChartDataEntry(value: 59, label: Translation().EggDairy)
    ]
    
    static var februaryPieChartData: [PieChartDataEntry] = [
        PieChartDataEntry(value: 160, label: Translation().Meat),
        PieChartDataEntry(value: 87, label: Translation().Vegetables),
        PieChartDataEntry(value: 70, label: Translation().Fruit),
        PieChartDataEntry(value: 43, label: Translation().EggDairy)
    ]
    
    static var marchPieChartData: [PieChartDataEntry] = [
        PieChartDataEntry(value: 90, label: Translation().Meat),
        PieChartDataEntry(value: 124, label: Translation().Vegetables),
        PieChartDataEntry(value: 96, label: Translation().Fruit),
        PieChartDataEntry(value: 50, label: Translation().EggDairy)
    ]
    
    static var aprilPieChartData: [PieChartDataEntry] = [
        PieChartDataEntry(value: 100, label: Translation().Meat),
        PieChartDataEntry(value: 104, label: Translation().Vegetables),
        PieChartDataEntry(value: 10, label: Translation().Fruit),
        PieChartDataEntry(value: 36, label: Translation().EggDairy)
    ]
    
    static var mayPieChartData: [PieChartDataEntry] = [
        PieChartDataEntry(value: 180, label: Translation().Meat),
        PieChartDataEntry(value: 180, label: Translation().Vegetables),
        PieChartDataEntry(value: 0, label: Translation().Fruit),
        PieChartDataEntry(value: 0, label: Translation().EggDairy)
    ]
}
