//
//  TestViewModel.swift
//  NearTruck
//
//  Created by 윤형찬 on 2023/09/06.
//

import SwiftUI

class TruckMapViewModel: ObservableObject {
    var coordinator: TruckMapCoordinator?
    
    @Published var titleText = "윤형찬"
    
    func goBack() {
        self.coordinator?.goBack()
    }
}

