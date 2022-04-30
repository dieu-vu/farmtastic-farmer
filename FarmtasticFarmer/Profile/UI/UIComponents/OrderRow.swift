//
//  OrderRow.swift
//  FarmtasticFarmer
//
//  Created by Giang Nguyen on 21.4.2022.
//  UI component for each order row inside the Active order view

import SwiftUI

struct OrderRow: View {
    var order: ActiveOrder
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("Order \(order.order_id)").font(.title3).bold()
            Text("Pickup date: \(order.pickup_date)").bold()
            Text("Pickup location: \(order.pickup_location)").bold()
                .padding(.bottom, 5)
            VStack(alignment: .leading, spacing: 5) {
                ForEach(order.items, id: \.id) { item in
                    Text("\(item.sold_quantity) x \(item.name)").font(.subheadline)
                }
            }.padding(.bottom, 10)
            Text("Order date: \(order.order_date)").font(.subheadline).foregroundColor(Color.gray)
        }
    }
}

struct OrderRow_Previews: PreviewProvider {
    static var previews: some View {
        OrderRow(order: ActiveOrder(order_id: 1, order_date: "2022-04-20 13:47:29 +0000", pickup_date: "2022-04-20 13:47:29 +0000", pickup_location: 1, items:[Item(id: 1, name: "Chicken", sold_quantity: "5kg")]))
    }
}
