//
//  Coordinator.swift
//  NearTruck
//
//  Created by 윤형찬 on 2023/08/30.
//

import UIKit

protocol Coordinator {
    var navigationController: UINavigationController { get }
    func start()
}
