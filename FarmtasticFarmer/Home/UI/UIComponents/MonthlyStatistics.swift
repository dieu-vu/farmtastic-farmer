//
//  MonthlyStatistics.swift
//  FarmtasticFarmer
//
//  Created by Giang Nguyen on 28.4.2022.
//

import SwiftUI
import Charts

struct MonthlyStatistics: View {
    @AppStorage("language")
    private var language = LocalizationService.shared.language
    @State var selectedMonth: String = DateUtils().getCurrentMonthString()
    
    func getSelectedMonthRevenue() -> Double {
        let allRevenue = StatisticsData.yearlyLineChartData.map { $0.y }
        if let index = DateUtils().getMonthInt(month: selectedMonth) {
            return allRevenue[index]
        } else {
            return 0.0
        }
    }
    
    var body: some View {
        VStack {
            HStack {
                Text("statistics.selectMonth".localized(language: language)).foregroundColor(Color("DarkGreen"))
                Picker("", selection: $selectedMonth) {
                    ForEach(DateUtils().months, id: \.self) {
                        Text(String($0.capitalized))
                    }
                }
            }
            
            AnalyticsCard().overlay(
                VStack (alignment: .leading) {
                    Text("statistics.revenueOverview".localized(language: language)).font(.subheadline).foregroundColor(Color("DarkGreen"))
                    Text("€ " + String(format: "%.2f", getSelectedMonthRevenue())).font(.title).bold().foregroundColor(Color("DarkGreen"))
                    
                    if let data = StatisticsData.monthlyLineChartData[selectedMonth] {
                        LineChart(entries: data, isYearly: false).frame(height: 300)
                    } else {
                        Text("statistics.noData".localized(language: language))
                    }
                }.padding(.horizontal, 40)
                
            )
            
            AnalyticsCard().overlay(
                VStack (alignment: .leading) {
                    Text("statistics.totalOrders".localized(language: language)).font(.subheadline).foregroundColor(Color("DarkGreen"))
                    Text("3402").font(.title).bold().foregroundColor(Color("DarkGreen"))
                    
                    if let data = StatisticsData.monthlyPieChartData[selectedMonth] {
                        PieChart(entries: data).frame(height: 300)
                    } else {
                        Text("statistics.noData".localized(language: language))
                    }
                   
                }.padding(.horizontal, 40)
            )
        }
    }
}

struct MonthlyStatistics_Previews: PreviewProvider {
    static var previews: some View {
        MonthlyStatistics()
    }
}

