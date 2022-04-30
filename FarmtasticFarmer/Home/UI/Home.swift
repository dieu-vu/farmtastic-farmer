//
//  Home.swift
//  FarmtasticFarmer
//
//  Created by Nguyen Giang on 7.4.2022.
//

import SwiftUI

struct Home: View {
    @State var selection: String = Translation().StatisticsMonthly
    var selections: [String] = [Translation().StatisticsMonthly, Translation().StatisticsYearly]
    
    init() {
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(Color("PinkishRed"))
        
        let attributes: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor.white]
        
        UISegmentedControl.appearance().setTitleTextAttributes(attributes, for: .selected)
    }
    
    func graph() {
        print(selection)
    }
    
    var body: some View {
        VStack {
            ScreenLayout(screenTitle: "statistics", hasBackButton: false)
            
            Picker("Picker", selection: $selection) {
                ForEach(selections, id: \.self) {
                    Text($0)
                }
            }
            .padding(.horizontal, 20)
            .padding(.top, 40)
            .pickerStyle(SegmentedPickerStyle())
            
            ScrollView {
                if selection == Translation().StatisticsMonthly {
                    MonthlyStatistics()
                } else {
                    YearlyStatistics()
                }
                Spacer()
            }.navigationBarHidden(true)
        }.edgesIgnoringSafeArea(.top)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
