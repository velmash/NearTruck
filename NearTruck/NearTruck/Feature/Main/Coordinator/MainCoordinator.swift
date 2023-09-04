//
//  MainCoordinator.swift
//  NearTruck
//
//  Created by 윤형찬 on 2023/08/30.
//

import UIKit

class MainCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = MainViewController()
        let viewModel = MainViewModel()
        
        viewModel.coordinator = self
        vc.viewModel = viewModel
        
        navigationController.pushViewController(vc, animated: false)
    }
    
    func goDetail(type: FoodType) {
        let coordinator = DetailCoordinator(navigationController: navigationController, type: type)
        
        coordinator.start()
    }
}
