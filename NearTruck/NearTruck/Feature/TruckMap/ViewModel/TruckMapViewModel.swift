//
//  TestViewModel.swift
//  NearTruck
//
//  Created by 윤형찬 on 2023/09/06.
//

import SwiftUI
import iNaviMaps
import CoreLocation

class TruckMapViewModel: ObservableObject {
    var coordinator: TruckMapCoordinator?
    
    @Published var titleText = "윤형찬"
    @Published var toastMessage = ""
    
    func goBack() {
        self.coordinator?.goBack()
    }
    
    func didDoubleTapMap(at point: CGPoint, latLng: INVLatLng) {
        
        let existingLocation = CLLocation(latitude: 37.40208204325117, longitude: 127.11101318683836)
        let touchedLocation = CLLocation(latitude: latLng.lat, longitude: latLng.lng)
//        print("화면상 좌표 : (\(point.x), \(point.y))\n" +
//              "지도상 좌표 : (\(latLng.lat), \(latLng.lng))")
        
        let distanceInMeters = touchedLocation.distance(from: existingLocation)
        if distanceInMeters < 300 {
            toastMessage = "반경 300m 이하 핑"
        } else {
            toastMessage = "반경 300m 초과 핑"
        }
    }
}

