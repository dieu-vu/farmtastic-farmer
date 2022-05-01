//
//  MapUIView.swift
//  FarmtasticFarmer
//
//  Created by hanghuynh on 26.4.2022.

import MapKit
import SwiftUI

// This is the UI view of the map.
// On the map there will be current location of user, pickpup points at which the farmer has to deliver his products.
// The pickup points will change according to order data. If there is no order data for a certain pickup point, the pickup point will not be marked on the map
// Routing will also be shown on the map. The route will vary depending on the order data. Generally, the map displys the round trip from the current user location to all the pickup points that the famer has to visit that specific date and back at the starting location

struct MapUIView: View {
    var manager = LocationManager()
    @State private var mapRoutes: [String] = []
    @State private var showDirections = false
    @Binding var selectedDate: Date
    @State var orders: [ActiveOrder]
    @State var screenTitle: String = "order.deliveryDate"
    
    var body: some View {
        VStack {
            ScreenLayout(screenTitle: "order.deliveryDate", hasBackButton: true, subTitle: "\(orders[0].pickup_date)")
            MapView(mapRoutes: $mapRoutes, orders: $orders, currentLocation: manager.region.center)
            ButtonView(buttonText: Translation().ShowDirection,
                       buttonColorLight: "LightGreen",
                       buttonColorDark: "DarkGreen",
                       buttonAction: {
                self.showDirections.toggle()
            })
            .padding(.bottom, 32)
            .disabled(mapRoutes.isEmpty)
        }
        .navigationBarHidden(true)
        .sheet(isPresented: $showDirections, content: {
            VStack {
                Text(Translation().OrderDirection)
                    .font(.title)
                    .bold()
                    .padding(8)
                List {
                    ForEach(0..<self.mapRoutes.count, id: \.self) { i in
                        Text(self.mapRoutes[i])
                            .padding()
                    }
                }
                ButtonView(buttonText: Translation().Dismiss,
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
    
    @Binding var mapRoutes: [String]
    @Binding var orders: [ActiveOrder]
    var pickupPointsId: Set<Int> { Set(orders.map { $0.pickup_location }) }
    let currentLocation: CLLocationCoordinate2D
    
    func makeCoordinator() -> MapViewCoordinator {
        return MapViewCoordinator()
    }
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        let pickupPoints: [PickupPoint] = matchingIdsWithPickupLocations(pickupPointIds: pickupPointsId)
        let groupedRoute = groupRoutes(origin: MKPlacemark(coordinate: currentLocation), stops: pickupPoints)
        
        mapView.delegate = context.coordinator
        
        let region = MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 60.2285525, longitude: 24.8110547),
            span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)
        )
        
        mapView.setRegion(region, animated: true)
        mapView.showsUserLocation = true
        mapView.userTrackingMode = MKUserTrackingMode.follow
        
        pickupPoints.forEach { point in
            let annotation = MKPointAnnotation()
            annotation.coordinate = point.coordinate
            annotation.title = point.name
            mapView.addAnnotation(annotation)
        }
        
        groupedRoute.forEach { pair in
            let request = MKDirections.Request()
            request.source = MKMapItem(placemark: pair.startItem)
            request.destination = MKMapItem(placemark: pair.endItem)
            request.transportType = .automobile
            
            let directions = MKDirections(request: request)
            directions.calculate { response, error in
                guard let route = response?.routes.first else { return }
                mapView.addOverlay(route.polyline)
                mapView.setVisibleMapRect(route.polyline.boundingMapRect, edgePadding: UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20), animated: true)
                let mapRoute = route.steps.map { $0.instructions }.filter { !$0.isEmpty }
                mapRoutes += mapRoute
            }
        }
        
        return mapView
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        
    }
    
    class MapViewCoordinator: NSObject, MKMapViewDelegate {
        func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
            let renderer = MKPolylineRenderer(overlay: overlay)
            renderer.strokeColor = .blue
            renderer.lineWidth = 5
            return renderer
        }
    }
}

func matchingIdsWithPickupLocations(pickupPointIds: Set<Int>) -> [PickupPoint]{
    var pickupPoints: [PickupPoint] = []
    pickupPointIds.forEach { id in
        switch id {
        case 1:
            pickupPoints.append(PickupPoint.samplePickupPointLists[0])
        case 2:
            pickupPoints.append(PickupPoint.samplePickupPointLists[1])
        default:
            pickupPoints.append(PickupPoint.samplePickupPointLists[2])
        }
    }
    return pickupPoints
}

func groupRoutes(origin: MKPlacemark, stops: [PickupPoint]) -> [(startItem: MKPlacemark, endItem: MKPlacemark)] {
    
    let formattedStops = stops.map { MKPlacemark(coordinate: $0.coordinate) }
    var groupedRoutes: [(startItem: MKPlacemark, endItem: MKPlacemark)] = []
    
    if stops.isEmpty {
        return []
    }
    
    groupedRoutes.append((origin, formattedStops[0]))
    
    if stops.count == 2 {
        groupedRoutes.append((formattedStops[0], formattedStops[1]))
        groupedRoutes.append((formattedStops[1], origin))
    }
    
    if stops.count == 3 {
        groupedRoutes.append((formattedStops[0], formattedStops[1]))
        groupedRoutes.append((formattedStops[1], formattedStops[2]))
        groupedRoutes.append((formattedStops[2], origin))
    }
    
    return groupedRoutes
}
