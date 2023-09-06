//
//  TestCoordinator.swift
//  NearTruck
//
//  Created by 윤형찬 on 2023/09/06.
//

import UIKit

class TruckMapCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewModel = TruckMapViewModel()
        viewModel.coordinator = self
        let vc = BridgeVC(viewModel: viewModel)
        
        navigationController.pushViewController(vc, animated: true)
    }
    
    func goBack() {
        navigationController.popViewController(animated: true)
    }
}
