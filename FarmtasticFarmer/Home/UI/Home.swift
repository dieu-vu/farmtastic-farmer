//
//  Home.swift
//  FarmtasticFarmer
//
//  Created by Nguyen Giang on 7.4.2022.
//

import SwiftUI

//This is Statistics screen
struct Home: View {
    @State var selection: Int = 0
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
                ForEach(selections.indices, id: \.self) { index in
                    Text(selections[index])
                }
            }
            .padding(.horizontal, 20)
            .padding(.top, 40)
            .pickerStyle(SegmentedPickerStyle())
            
            ScrollView {
                if selection == 0 {
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
