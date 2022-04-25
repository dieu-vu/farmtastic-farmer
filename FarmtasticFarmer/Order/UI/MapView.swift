//
//  MapView.swift
//  FarmtasticFarmer
//
//  Created by hanghuynh on 19.4.2022.
//

import MapKit
import CoreLocation
import SwiftUI

struct PickupPoint: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
}

extension PickupPoint {
    static let samplePickupPointLists: [PickupPoint] =
        [
            PickupPoint(name: "Rautatienasema", coordinate: CLLocationCoordinate2D(latitude: 61.29, longitude: 24.96)),
            PickupPoint(name: "Sello", coordinate: CLLocationCoordinate2D(latitude: 62.29, longitude: 24.96)),
            PickupPoint(name: "Jumbo", coordinate: CLLocationCoordinate2D(latitude: 60.29, longitude: 24.96))
        ]
}

struct MapView: View {
    
    /*@State private var mapRegion = MKCoordinateRegion(
        center: CLLocationCoordinate2D(
        latitude: 60.22,
        longitude: 24.76),
        span: MKCoordinateSpan(
            latitudeDelta: 0.5,
            longitudeDelta: 0.5))*/
    @StateObject var manager = LocationManager()
    @State var tracking: MapUserTrackingMode = .follow
    @Binding var selectedDate: Date
    let orders: [ActiveOrder]
    
    var pickupPointsId: Set<Int> { Set(orders.map { $0.pickup_location }) }
    
    var body: some View {
        ZStack{
            Map(
                coordinateRegion: $manager.region,
                interactionModes: MapInteractionModes.all,
                showsUserLocation: true,
                userTrackingMode: $tracking,
                annotationItems: matchingIdsWithPickupLocations(pickupPointIds: pickupPointsId)
            ) { point in
                MapMarker(coordinate: point.coordinate)
            }
            VStack(alignment: .trailing) {
                Spacer()
                Button {
                } label: {
                    Image(systemName: "location.fill")
                }
                .padding()
                .background(Circle().fill(Color.white))
            }
            .offset(x: 150, y: -20)
        }
        .navigationTitle("\(selectedDate)")
    }
}

func matchingIdsWithPickupLocations(pickupPointIds: Set<Int>) -> [PickupPoint]{
    var pickupPoints: [PickupPoint] = []
    pickupPointIds.forEach { id in
        switch id {
        case 1:
            pickupPoints.append(PickupPoint(name: "Rautatienasema", coordinate: CLLocationCoordinate2D(latitude: 60.1703535, longitude: 24.9388679)))
        case 2:
            pickupPoints.append(PickupPoint(name: "Sello", coordinate: CLLocationCoordinate2D(latitude: 60.2181571, longitude: 24.8086836)))
        default:
            pickupPoints.append(PickupPoint(name: "Jumbo", coordinate: CLLocationCoordinate2D(latitude: 60.2915341, longitude: 24.962077)))
        }
    }
    return pickupPoints
}

/*struct MapView_Previews: PreviewProvider {
    static var previews: some View {
       MapView(selectedDate: $selectedDate)
    }
}*/
