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
        vc.coordinator = self
        
        navigationController.pushViewController(vc, animated: false)
    }
    
    func goDetail() {
        print("가자~")
    }
}
