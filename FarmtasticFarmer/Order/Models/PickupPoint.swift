//
//  PickupPoint.swift
//  FarmtasticFarmer
//
//  Created by hanghuynh on 28.4.2022.
//

import Foundation
import MapKit

struct PickupPoint {
    let id: Int
    let name: String
    let coordinate: CLLocationCoordinate2D
}

extension PickupPoint {
    static let samplePickupPointLists: [PickupPoint] =
        [
            PickupPoint(id: 1, name: "Rautatienasema", coordinate: CLLocationCoordinate2D(latitude: 60.1703535, longitude: 24.9388679)),
            PickupPoint(id: 2, name: "Sello", coordinate: CLLocationCoordinate2D(latitude: 60.2181571, longitude: 24.8086836)),
            PickupPoint(id: 3, name: "Jumbo", coordinate: CLLocationCoordinate2D(latitude: 60.2915341, longitude: 24.962077))
        ]
}
