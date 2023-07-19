//
//  MapView.swift
//  ForSwiftUI
//
//  Created by Kevin on 2023/7/19.
//

import SwiftUI
import MapKit

struct MapView: View {
    var coordinate: CLLocationCoordinate2D
    @State private var regin = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 33.936558569288735, longitude: 106.4073888447679), span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
    
    var body: some View {
        Map(coordinateRegion: $regin)
            .onAppear {
                setRegion(coordinate)
            }
    }
    
    private func setRegion(_ coordinate: CLLocationCoordinate2D) {
        regin = MKCoordinateRegion(center: coordinate,
                                   span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
        )
    }
}

//struct MapView_Previews: PreviewProvider {
//    static var previews: some View {
//        MapView(coordinate: CLLocationCoordinate2D(latitude: 33.936558569288735, longitude: 106.4073888447679))
//    }
//}
