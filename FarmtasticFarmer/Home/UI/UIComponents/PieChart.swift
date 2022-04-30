//
//  PieChart.swift
//  FarmtasticFarmer
//
//  Created by Giang Nguyen on 28.4.2022.
//

import Charts
import SwiftUI

struct PieChart: UIViewRepresentable {
    let entries: [ChartDataEntry]
    let pieChart = PieChartView()
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }
    
    func makeUIView(context: Context) -> PieChartView {
        pieChart.delegate = context.coordinator
        pieChart.noDataText = Translation().NoData
                        
        pieChart.legend.enabled = false
        pieChart.drawEntryLabelsEnabled = true
    
        pieChart.usePercentValuesEnabled = true
        pieChart.sliceTextDrawingThreshold = 30
        
        pieChart.isUserInteractionEnabled = false
        pieChart.animate(xAxisDuration: 1)
        
        return pieChart
    }
    
    func updateUIView(_ uiView: PieChartView, context: Context) {
        let dataSet = PieChartDataSet(entries: entries)
        dataSet.label = "Product Group"
        dataSet.colors = ChartColorTemplates.material()
        dataSet.drawIconsEnabled = true
        dataSet.valueColors = [.black]
        uiView.data = PieChartData(dataSet: dataSet)
        uiView.notifyDataSetChanged()
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .percent
        formatter.maximumFractionDigits = 1
        formatter.multiplier = 1
        formatter.percentSymbol = "%"
        dataSet.valueFormatter = DefaultValueFormatter(formatter: formatter)

    }
    
    class Coordinator: NSObject, ChartViewDelegate {
        let parent: PieChart
        
        init(parent: PieChart) {
            self.parent = parent
        }
    }
}
