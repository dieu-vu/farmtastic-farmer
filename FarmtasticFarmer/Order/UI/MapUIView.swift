//
//  MapUIView.swift
//  FarmtasticFarmer
//
//  Created by hanghuynh on 26.4.2022.
//
import MapKit
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

struct MapUIView: View {
    var manager = LocationManager()
    @State private var directions: [String] = []
    @State private var showDirections = false
    @Binding var selectedDate: Date
    @State var orders: [ActiveOrder]
    
    
    var body: some View {
        VStack {
            
            MapView(directions: $directions, orders: $orders, currentLocation: manager.region.center)
            ButtonView(buttonText: "Show Directions",
                       buttonColorLight: "LightGreen",
                       buttonColorDark: "DarkGreen",
                       buttonAction: {
                self.showDirections.toggle()
            })
            .disabled(directions.isEmpty)
        }
        .sheet(isPresented: $showDirections, content: {
            VStack {
                Text("Directions")
                    .font(.largeTitle)
                    .bold()
                    .padding()
                
                List {
                    ForEach(0..<self.directions.count, id: \.self) { i in
                        Text(self.directions[i])
                            .padding()
                    }
                }
                
                ButtonView(buttonText: "Dismiss",
                           buttonColorLight: "LightGreen",
                           buttonColorDark: "DarkGreen",
                           buttonAction: {
                    showDirections = false
                })
            }
        })
    }
}

/*struct MapUIView_Previews: PreviewProvider {
    static var previews: some View {
        MapUIView()
    }
}*/

struct MapView: UIViewRepresentable {
    typealias UIViewType = MKMapView
    
    @Binding var directions: [String]
    @Binding var orders: [ActiveOrder]
    var pickupPointsId: Set<Int> { Set(orders.map { $0.pickup_location }) }
    let currentLocation: CLLocationCoordinate2D
    
    func makeCoordinator() -> MapViewCoordinator {
        return MapViewCoordinator()
    }
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        let pickupPoints: [MKPlacemark] = matchingIdsWithPickupLocations(pickupPointIds: pickupPointsId)
        
        mapView.delegate = context.coordinator
        
        let region = MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 60.2285525, longitude: 24.8110547),
            span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)
        )
        
        mapView.setRegion(region, animated: true)
        mapView.showsUserLocation = true
        mapView.userTrackingMode = MKUserTrackingMode.follow
        
        print("User location: \(currentLocation)")
        let jumbo = MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 60.2915341, longitude: 24.962077))
        
        let request = MKDirections.Request()
        request.source = MKMapItem(placemark: MKPlacemark(coordinate: currentLocation))
        request.destination = MKMapItem(placemark: jumbo)
        request.transportType = .automobile
        
        let directions = MKDirections(request: request)
        directions.calculate { response, error in
            guard let route = response?.routes.first else { return }
            mapView.addAnnotations(pickupPoints)
            mapView.addOverlay(route.polyline)
            mapView.setVisibleMapRect(route.polyline.boundingMapRect, edgePadding: UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20), animated: true)
            self.directions = route.steps.map { $0.instructions }.filter { !$0.isEmpty }
        }
        
        return mapView
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        
    }
    
    class MapViewCoordinator: NSObject, MKMapViewDelegate {
        func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
            let renderer = MKPolylineRenderer(overlay: overlay)
            renderer.strokeColor = .green
            renderer.lineWidth = 5
            return renderer
        }
    }
}

func matchingIdsWithPickupLocations(pickupPointIds: Set<Int>) -> [MKPlacemark]{
    var pickupPoints: [MKPlacemark] = []
    pickupPointIds.forEach { id in
        switch id {
        case 1:
            pickupPoints.append(MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 60.1703535, longitude: 24.9388679)))
        case 2:
            pickupPoints.append(MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 60.2181571, longitude: 24.8086836)))
        default:
            pickupPoints.append(MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 60.2915341, longitude: 24.962077)))
        }
    }
    return pickupPoints
}
