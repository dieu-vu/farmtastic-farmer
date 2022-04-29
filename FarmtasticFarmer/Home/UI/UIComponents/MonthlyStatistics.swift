//
//  MonthlyStatistics.swift
//  FarmtasticFarmer
//
//  Created by Giang Nguyen on 28.4.2022.
//

import SwiftUI
import Charts

struct MonthlyStatistics: View {
    
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
                Text("Select month:").foregroundColor(Color("DarkGreen"))
                Picker("", selection: $selectedMonth) {
                    ForEach(DateUtils().months, id: \.self) {
                        Text(String($0.capitalized))
                    }
                }
            }
            
            AnalyticsCard().overlay(
                VStack (alignment: .leading) {
                    Text("Revenue Overview").font(.subheadline).foregroundColor(Color("DarkGreen"))
                    Text("€ " + String(format: "%.2f", getSelectedMonthRevenue())).font(.title).bold().foregroundColor(Color("DarkGreen"))
                    
                    if let data = StatisticsData.monthlyLineChartData[selectedMonth] {
                        LineChart(entries: data, isYearly: false).frame(height: 300)
                    } else {
                        Text("No data found.")
                    }
                }.padding(.horizontal, 40)
                
            )
            
            AnalyticsCard().overlay(
                VStack (alignment: .leading) {
                    Text("Total Orders").font(.subheadline).foregroundColor(Color("DarkGreen"))
                    Text("3402").font(.title).bold().foregroundColor(Color("DarkGreen"))
                    
                    if let data = StatisticsData.monthlyPieChartData[selectedMonth] {
                        PieChart(entries: data).frame(height: 300)
                    } else {
                        Text("No data found.")
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

