//
//  PickupPointScreen.swift
//  FarmtasticFarmer
//
//  Created by Trang on 23.4.2022.
//  UI view for the list of default pickup point (currently hardcoded data)

import SwiftUI
import CoreLocation

struct PickupPointScreen: View {
    @AppStorage("language")
    private var language = LocalizationService.shared.language
    let pickupPoints: [PickupPoint] = PickupPoint.samplePickupPointLists;
    @State var screenTitle = "profile.pickupPoint"
    @State var hasBackButton = true
    
    var body: some View {
        VStack {
            ScreenLayout(screenTitle: $screenTitle, hasBackButton: $hasBackButton)
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
