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
    let date: String
   }

   extension PickupPoint {
       static let samplePickupPointLists: [PickupPoint] =
           [
               PickupPoint(name: "Pickup point 1", coordinate: CLLocationCoordinate2D(latitude: 61.29, longitude: 24.96), date: "2022-04-19 13:47:29 +0000"),
               PickupPoint(name: "Pickup point 2", coordinate: CLLocationCoordinate2D(latitude: 62.29, longitude: 24.96), date: "2022-04-29 13:47:29 +0000"),
               PickupPoint(name: "Pickup point 3", coordinate: CLLocationCoordinate2D(latitude: 60.29, longitude: 24.96), date: "2022-04-21 13:47:29 +0000")
           ]
}

struct MapView: View {
    @State private var mapRegion = MKCoordinateRegion(
        center: CLLocationCoordinate2D(
        latitude: 60.22,
        longitude: 24.76),
        span: MKCoordinateSpan(
            latitudeDelta: 10,
            longitudeDelta: 10))
    @StateObject var manager = LocationManager()
    @State var tracking: MapUserTrackingMode = .follow
    
    let pickupPoints = [
        PickupPoint(name: "Pickup point 1", coordinate: CLLocationCoordinate2D(latitude: 60.17, longitude: 24.94)),
        PickupPoint(name: "Pickup point 2", coordinate: CLLocationCoordinate2D(latitude: 60.21, longitude: 24.80)),
        PickupPoint(name: "Pickup point 3", coordinate: CLLocationCoordinate2D(latitude: 60.29, longitude: 24.96))
    ]
    
    var body: some View {
        ZStack{
            Map(
                coordinateRegion: $manager.region,
                interactionModes: MapInteractionModes.all,
                showsUserLocation: true,
                userTrackingMode: $tracking,
                annotationItems: pickupPoints
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
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
