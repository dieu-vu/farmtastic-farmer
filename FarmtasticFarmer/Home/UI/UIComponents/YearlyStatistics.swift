//
//  YearlyStatistics.swift
//  FarmtasticFarmer
//
//  Created by Giang Nguyen on 28.4.2022.
//

import SwiftUI
import Charts

struct YearlyStatistics: View {
    @State var selectedYear: Int = DateUtils().getCurrentYear()
    
    var body: some View {
        VStack {
            HStack {
                Text("Select year: ").foregroundColor(Color("DarkGreen"))
                Picker("", selection: $selectedYear) {
                    ForEach(1970...2050, id: \.self) {
                        Text(String($0))
                    }
                }
            }
            
            if selectedYear == DateUtils().getCurrentYear() {
                VStack {
                    AnalyticsCard().overlay(
                        VStack (alignment: .leading) {
                            Text("Revenue Overview").font(.subheadline).foregroundColor(Color("DarkGreen"))
                            Text("€ 70138,45").font(.title).bold().foregroundColor(Color("DarkGreen"))
                            LineChart(entries: StatisticsData.yearlyLineChartData, isYearly: true).frame(height: 300)
                        }.padding(.horizontal, 40)
                    )
                    AnalyticsCard().overlay(
                        VStack (alignment: .leading) {
                            Text("Total Orders").font(.subheadline).foregroundColor(Color("DarkGreen"))
                            Text("3402").font(.title).bold().foregroundColor(Color("DarkGreen"))
                            PieChart(entries: StatisticsData.yearlyPieChartData).frame(height: 300)
                        }.padding(.horizontal, 40)
                    )
                }
            } else {
                Text ("No data found")
            }
        }.padding(.bottom, 20)
    }
}

struct YearlyStatistics_Previews: PreviewProvider {
    static var previews: some View {
        YearlyStatistics()
    }
}
