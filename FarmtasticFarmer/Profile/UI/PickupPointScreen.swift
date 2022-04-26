//
//  PickupPointScreen.swift
//  FarmtasticFarmer
//
//  Created by Trang on 23.4.2022.
//

import SwiftUI
import CoreLocation

struct PickupPointScreen: View {
    @AppStorage("language")
    private var language = LocalizationService.shared.language
    //let pickupPoints: [PickupPoint] = PickupPoint.samplePickupPointLists;
    
    var body: some View {
        VStack {
            ButtonView(buttonText: "Add New",
                       buttonColorLight: "LightYellow",
                       buttonColorDark: "Yellow",
                       buttonAction: {
            })
            
            /*List(pickupPoints,
                id: \.id) { pickupPoint in
                PickupPointRow(pickupPoint: pickupPoint)
            }*/
            
        }.navigationTitle("Active Orders")
    }
}

struct PickupPointScreen_Previews: PreviewProvider {
    static var previews: some View {
        PickupPointScreen()
    }
}
