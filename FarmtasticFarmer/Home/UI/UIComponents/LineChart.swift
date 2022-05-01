//
//  LineChart.swift
//  FarmtasticFarmer
//
//  Created by Giang Nguyen on 29.4.2022.
//

import SwiftUI
import Charts

//format and styling line chart
struct LineChart: UIViewRepresentable {
    let entries: [ChartDataEntry]
    let lineChart = LineChartView()
    let isYearly: Bool
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }
    
    func makeUIView(context: Context) -> LineChartView {
        lineChart.delegate = context.coordinator
        lineChart.noDataText = Translation().NoData
        
        lineChart.legend.enabled = false
        
        lineChart.setScaleEnabled(false)
        lineChart.isUserInteractionEnabled = true
        lineChart.animate(xAxisDuration: 2)
        
        return lineChart
    }
    
    func updateUIView(_ uiView: LineChartView, context: Context) {
        let dataSet = LineChartDataSet(entries: entries)
        formatDataSet(dataSet: dataSet)
        formatxAxis(xAxis: uiView.xAxis)
        formatyAxis(leftAxis: uiView.leftAxis, rightAxis: uiView.rightAxis)
        
        uiView.data = LineChartData(dataSet: dataSet)
        uiView.notifyDataSetChanged()
        
        isYearly
        ? uiView.zoom(scaleX: 1.7, scaleY: 1, xValue: 0, yValue: 0, axis: .left)
        : uiView.zoom(scaleX: 4, scaleY: 1, xValue: 0, yValue: 0, axis: .left)
    }
    
    //format data and how the data is arranged on chart
    func formatDataSet(dataSet: LineChartDataSet) {
        dataSet.label = isYearly ? "Revenue in year" : "Revenue in month"
        dataSet.colors = [UIColor(Color("DarkGreen"))]
        dataSet.valueFormatter = DefaultValueFormatter(decimals: 0)
        dataSet.drawCirclesEnabled = false
        dataSet.drawValuesEnabled = false
        dataSet.lineWidth = 3
        dataSet.mode = .cubicBezier
        dataSet.drawFilledEnabled = true
        dataSet.fill = ColorFill(color: UIColor(Color("LightGreen")))
        dataSet.drawHorizontalHighlightIndicatorEnabled = false
        dataSet.highlightColor = UIColor(Color("PinkishRed"))
    }
    
    //format and add label for xAxis
    func formatxAxis(xAxis: XAxis) {
        xAxis.enabled = true
        if isYearly {
            xAxis.valueFormatter = IndexAxisValueFormatter(values: DateUtils().abbrevMonths)
        }
        xAxis.labelPosition = .bottom
        xAxis.labelTextColor = UIColor(Color("DarkGreen"))
    }
    
    //format and style left and right axis
    func formatyAxis(leftAxis: YAxis, rightAxis: YAxis) {
        leftAxis.axisMinimum = 0
        rightAxis.enabled = false
    }
    
    class Coordinator: NSObject, ChartViewDelegate {
        let parent: LineChart
        
        init(parent: LineChart) {
            self.parent = parent
        }
    }
}
