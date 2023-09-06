//
//  MapView.swift
//  NearTruck
//
//  Created by 윤형찬 on 2023/09/06.
//

import UIKit
import iNaviMaps
import SwiftUI

struct MapViewRepresentable: UIViewRepresentable {
    @ObservedObject var viewModel: TruckMapViewModel
    
    class Linker: NSObject, INVMapViewDelegate {
        var viewModel: TruckMapViewModel
        
        init(viewModel: TruckMapViewModel) {
            self.viewModel = viewModel
        }
        
        func didDoubleTapMapView(_ point: CGPoint, latLng latlng: INVLatLng) -> Bool {
            viewModel.didDoubleTapMap(at: point, latLng: latlng)
            return true
        }
    }
    
    func makeCoordinator() -> Linker {
        Linker(viewModel: viewModel)
    }
    
    func makeUIView(context: Context) -> InaviMapView {
        let mapView = InaviMapView()
        mapView.delegate = context.coordinator
        return mapView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        uiView.isTiltGesturesEnabled = false
        uiView.isRotateGesturesEnabled = false
        //TODO: 서버에서 받는 좌표값으로 Pin or Cluster 표출
    }
}
