//
//  DetailCoordinator.swift
//  NearTruck
//
//  Created by 윤형찬 on 2023/08/30.
//

import UIKit

class DetailCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = DetailViewController()
        vc.coordinator = self
        
        navigationController.pushViewController(vc, animated: true)
    }
    
    func goBack() {
        navigationController.popViewController(animated: true)
    }
}
