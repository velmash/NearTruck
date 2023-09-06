//
//  TestViewModel.swift
//  NearTruck
//
//  Created by 윤형찬 on 2023/09/06.
//

import SwiftUI
import iNaviMaps

class TruckMapViewModel: ObservableObject {
    var coordinator: TruckMapCoordinator?
    
    @Published var titleText = "윤형찬"
    
    func goBack() {
        self.coordinator?.goBack()
    }
    
    func didDoubleTapMap(at point: CGPoint, latLng: INVLatLng) {
        print("화면상 좌표 : (\(point.x), \(point.y))\n" +
              "지도상 좌표 : (\(latLng.lat), \(latLng.lng))")
    }
}

