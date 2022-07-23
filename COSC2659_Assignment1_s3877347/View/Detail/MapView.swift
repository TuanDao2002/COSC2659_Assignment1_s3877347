/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 1
  Author: Dao Kha Tuan
  ID: 3877347
  Created  date: 16/07/2022
  Last modified: 07/08/2022
  Acknowledgement: None
*/

import SwiftUI
import MapKit

// a view to display university's location on a map
struct MapView: View {
    var name: String
    var latitude: Double
    var longitude: Double
    
    @State private var region: MKCoordinateRegion
    
    struct Place: Identifiable { // a struct used for MapMarker to mark the university's location
        let id = UUID()
        let name: String
        let coordinate: CLLocationCoordinate2D
    }
    
    var annotations: [Place]
    
    init(name: String, latitude: Double, longitude: Double) {
        self.name = name
        self.latitude = latitude
        self.longitude = longitude
        region = MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: latitude, longitude: longitude),
            span: MKCoordinateSpan(latitudeDelta: 0.0125, longitudeDelta: 0.0125)
        )
        
        annotations = [
            Place(name: name, coordinate: CLLocationCoordinate2D(latitude: latitude, longitude: longitude))
        ]
    }
    
    var body: some View {
        // use the coordination of the university to location it with a map that can be moved, zoom and has a marker to mark the university's location
        Map(coordinateRegion: $region, interactionModes: [.zoom, .pan], annotationItems: annotations) {
            MapMarker(coordinate: $0.coordinate)
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(name: "RMIT", latitude: 10.729444, longitude: 106.695278)
    }
}
