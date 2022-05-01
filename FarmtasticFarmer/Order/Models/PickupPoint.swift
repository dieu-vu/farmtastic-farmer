//
//  PickupPoint.swift
//  FarmtasticFarmer
//
//  Created by hanghuynh on 28.4.2022.

import Foundation
import MapKit

// PickupPoint struct is the blueprint of what information a pickup point should contain.
// Params: id, name, address, coordinate(consists of latitude and longitude)

struct PickupPoint {
    let id: Int
    let name: String
    let address: String
    let coordinate: CLLocationCoordinate2D
}

extension PickupPoint {
    static let samplePickupPointLists: [PickupPoint] =
        [
            PickupPoint(id: 1, name: "Rautatienasema", address: "00100 Helsinki", coordinate: CLLocationCoordinate2D(latitude: 60.1703535, longitude: 24.9388679)),
            PickupPoint(id: 2, name: "Sello", address: "Leppävaarankatu 3-9, 02600 Espoo", coordinate: CLLocationCoordinate2D(latitude: 60.2181571, longitude: 24.8086836)),
            PickupPoint(id: 3, name: "Jumbo", address: "Vantaanportinkatu 3, 01510 Vantaa" , coordinate: CLLocationCoordinate2D(latitude: 60.2915341, longitude: 24.962077))
        ]
}
