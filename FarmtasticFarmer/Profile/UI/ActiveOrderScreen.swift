//
//  ActiveOrderScreen.swift
//  FarmtasticFarmer
//
//  Created by Giang Nguyen on 21.4.2022.
//

import SwiftUI

struct ActiveOrderScreen: View {
    @AppStorage("language")
    private var language = LocalizationService.shared.language
    @ObservedObject var loader = ActiveOrderLoader()
    @State var selectedDate = Date()
    
    func dateFormat(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-dd"
        return dateFormatter.string(from: date)
    }
    
    var body: some View {
        VStack {
            HStack {
                DatePicker("Select pickup date:", selection: $selectedDate, in: Date()..., displayedComponents: .date)
                Spacer()
                Image(systemName: "map").font(.title).foregroundColor(Color("PinkishRed"))
            }.padding(.horizontal, 20)
            
            List(loader.activeOrders.filter { $0.pickup_date == dateFormat(selectedDate) },
                id: \.order_id) { order in
                OrderRow(order: order)
            }
            
        }.navigationTitle("Active Orders")
    }
}

struct ActiveOrderScreen_Previews: PreviewProvider {
    static var previews: some View {
        ActiveOrderScreen()
    }
}
