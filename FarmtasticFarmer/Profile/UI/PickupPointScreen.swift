//
//  PickupPointScreen.swift
//  FarmtasticFarmer
//
//  Created by Trang on 23.4.2022.
//  UI view for the list of default pickup point (currently hardcoded data)

import SwiftUI
import CoreLocation

struct PickupPointScreen: View {
    let pickupPoints: [PickupPoint] = PickupPoint.samplePickupPointLists;
    
    var body: some View {
        VStack {
            ScreenLayout(screenTitle: "profile.pickupPoint", hasBackButton: true)
            List {
                ForEach(pickupPoints, id: \.id) { point in
                    PickupPointRow(pickupPoint: point)
                }
            }
        }
        .navigationBarHidden(true)
    }
}

struct PickupPointScreen_Previews: PreviewProvider {
    static var previews: some View {
        PickupPointScreen()
    }
}
