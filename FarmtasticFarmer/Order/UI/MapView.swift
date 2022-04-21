//
//  MapView.swift
//  FarmtasticFarmer
//
//  Created by hanghuynh on 19.4.2022.
//

import MapKit
import CoreLocation
import SwiftUI

struct Location: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
}

struct MapView: View {
    @State private var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 60.22, longitude: 24.76), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
    
    let locations = [
        Location(name: "Pickup point 1", coordinate: CLLocationCoordinate2D(latitude: 60.17, longitude: 24.94)),
        Location(name: "Pickup point 2", coordinate: CLLocationCoordinate2D(latitude: 60.21, longitude: 24.80)),
        Location(name: "Pickup point 3", coordinate: CLLocationCoordinate2D(latitude: 60.29, longitude: 24.96))
    ]
    
    var body: some View {
        ZStack{
            Map(coordinateRegion: $mapRegion, annotationItems: locations) { location in
                MapMarker(coordinate: location.coordinate)
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
