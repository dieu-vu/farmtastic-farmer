//
//  PickupPointRow.swift
//  FarmtasticFarmer
//
//  Created by Trang on 23.4.2022.
//


import SwiftUI
import CoreLocation

struct PickupPointRow: View {
    @AppStorage("language")
    private var language = LocalizationService.shared.language
    var pickupPoint: PickupPoint
    var body: some View {
        HStack(){
            VStack(alignment: .leading, spacing: 5) {
                Text("Address: \(pickupPoint.coordinate.latitude)").font(.title3).bold()
                Text("Date: \(pickupPoint.date)").bold()
                Text("Time: \(pickupPoint.date)").bold()
                    .padding(.bottom, 5)
            }
            Image(systemName: "pencil")
                                   .aspectRatio(contentMode: .fit)
                                   .foregroundColor(Color.black)
            Image(systemName: "trash")
                                   .aspectRatio(contentMode: .fit)
                                   .foregroundColor(Color.black)
        }.padding()
            .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.green, lineWidth: 1)
        )
        
    }
}

struct PickupPointRow_Previews: PreviewProvider {
    static var previews: some View {
        PickupPointRow(pickupPoint: PickupPoint(name: "Pickup point 3", coordinate: CLLocationCoordinate2D(latitude: 60.29, longitude: 24.96), date: "2022-04-20 13:47:29 +0000"))
    }
}

