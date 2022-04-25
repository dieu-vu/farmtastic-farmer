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
    let pickupPoints: [PickupPoint] = PickupPoint.samplePickupPointLists;
    @State var screenTitle = "profile.pickupPoint"
    @State var hasBackButton = true
    
    var body: some View {
        VStack {
            ScreenLayout(screenTitle: $screenTitle, hasBackButton: $hasBackButton)
            ButtonView(buttonText: "Add New",
                       buttonColorLight: "LightGreen",
                       buttonColorDark: "DarkGreen",
                       buttonAction: {
            })
            
            List(pickupPoints, id: \.id) { pickupPoint in
                PickupPointRow(pickupPoint: pickupPoint)
            }
            
        }.navigationBarHidden(true)
    }
}

struct PickupPointScreen_Previews: PreviewProvider {
    static var previews: some View {
        PickupPointScreen()
    }
}
