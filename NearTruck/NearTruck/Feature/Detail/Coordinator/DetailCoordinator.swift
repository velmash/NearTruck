//
//  DetailCoordinator.swift
//  NearTruck
//
//  Created by 윤형찬 on 2023/08/30.
//

import UIKit

class DetailCoordinator: Coordinator {
    var foodType: FoodType
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController, type: FoodType) {
        self.navigationController = navigationController
        self.foodType = type
    }
    
    func start() {
        let vc = DetailViewController()
        let viewModel = DetailViewModel()
        
        viewModel.coordinator = self
        vc.viewModel = viewModel
        vc.foodType = foodType
        
        navigationController.pushViewController(vc, animated: true)
    }
    
    func goBack() {
        navigationController.popViewController(animated: true)
    }
}
