//
//  LocationManager.swift
//  FarmtasticFarmer
//
//  Created by hanghuynh on 26.4.2022.
//

import UIKit
import CoreLocation
import MapKit

// LocationManager manages which area in the map appreared on the screen.
// In Farmtastic app, the area in which current user is located will be displayed
class LocationManager: NSObject, CLLocationManagerDelegate, ObservableObject {

    @Published var region = MKCoordinateRegion()
    private let manager = CLLocationManager()
    
    override init() {
        super.init()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        locations.last.map {
            region = MKCoordinateRegion(
                center: CLLocationCoordinate2D(latitude: $0.coordinate.latitude, longitude: $0.coordinate.longitude),
                span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)
            )
        }
    }
}
