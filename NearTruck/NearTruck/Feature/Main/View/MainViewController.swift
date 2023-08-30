//
//  MainViewController.swift
//  NearTruck
//
//  Created by 윤형찬 on 2023/08/30.
//

import UIKit

class MainViewController: UIViewController {
    private let mainView = MainView()
    
    var coordinator: MainCoordinator?
    
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        print("HI")
    }
}
