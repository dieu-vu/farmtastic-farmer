//
//  Statistics.swift
//  FarmtasticFarmer
//
//  Created by Giang Nguyen on 28.4.2022.
//

import Foundation
import Charts

struct StatisticsData {
    static var yearlyBarChartData: [BarChartDataEntry] = [
        BarChartDataEntry(x: 1, y: 16105),
        BarChartDataEntry(x: 2, y: 17503),
        BarChartDataEntry(x: 3, y: 15785),
        BarChartDataEntry(x: 4, y: 20233),
        BarChartDataEntry(x: 5, y: 21328),
        BarChartDataEntry(x: 6, y: 22243),
        BarChartDataEntry(x: 7, y: 23757),
        BarChartDataEntry(x: 8, y: 23340),
        BarChartDataEntry(x: 9, y: 22453),
        BarChartDataEntry(x: 10, y: 20228),
        BarChartDataEntry(x: 11, y: 18842),
        BarChartDataEntry(x: 12, y: 12879),
    ]
    
    static var yearlyPieChartData: [PieChartDataEntry] = [
        PieChartDataEntry(value: 144, label: "Meat"),
        PieChartDataEntry(value: 108, label: "Vegetables"),
        PieChartDataEntry(value: 72, label: "Fruit"),
        PieChartDataEntry(value: 36, label: "Egg & Diary")
    ]
}
