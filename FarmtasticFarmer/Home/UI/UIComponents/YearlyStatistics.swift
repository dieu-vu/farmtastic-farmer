//
//  YearlyStatistics.swift
//  FarmtasticFarmer
//
//  Created by Giang Nguyen on 28.4.2022.
//

import SwiftUI
import Charts

let currentYear: Int = Calendar.current.component(.year, from: Date())

struct YearlyStatistics: View {
    @State var selectedYear: Int = currentYear
    
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
            
            if selectedYear == currentYear {
                VStack {
                    AnalyticsCard().overlay(
                        VStack (alignment: .leading) {
                            Text("Revenue Overview").font(.subheadline).foregroundColor(Color("DarkGreen")).padding(.leading, 20)
                            Text("€ 234 696").font(.title).bold().foregroundColor(Color("DarkGreen")).padding(.leading, 20)
                            LineChart(entries: StatisticsData.yearlyBarChartData).frame(height: 300)
                        }.padding([.horizontal, .bottom], 20)
                    )
                    AnalyticsCard().overlay(
                        VStack (alignment: .leading) {
                            Text("Total Orders").font(.subheadline).foregroundColor(Color("DarkGreen")).padding(.leading, 20)
                            Text("15 576").font(.title).bold().foregroundColor(Color("DarkGreen")).padding(.leading, 20)
                            PieChart(entries: StatisticsData.yearlyPieChartData).frame(height: 300)
                        }.padding(.horizontal, 20)
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
