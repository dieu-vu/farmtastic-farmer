//
//  MonthlyStatistics.swift
//  FarmtasticFarmer
//
//  Created by Giang Nguyen on 28.4.2022.
//

import SwiftUI
import Charts

struct MonthlyStatistics: View {
    var demoData: [PieChartDataEntry] = [
        PieChartDataEntry(value: 354, label: "Rewe"),
        PieChartDataEntry(value: 261, label: "Lidl"),
        PieChartDataEntry(value: 117, label: "Langer Name"),
        PieChartDataEntry(value: 14, label: "Aldi")
    ]
    let pieChart = PieChartView()
    
    
    var body: some View {
        VStack {
            PieChart(entries: demoData).frame(height: 300)
        }
    }
}

struct MonthlyStatistics_Previews: PreviewProvider {
    static var previews: some View {
        MonthlyStatistics()
    }
}

