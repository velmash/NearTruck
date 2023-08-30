//
//  BaseViewController.swift
//  NearTruck
//
//  Created by 윤형찬 on 2023/08/30.
//

import UIKit

class BaseViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
    }
    
    func setupNavigationBar() {
        navigationController?.isNavigationBarHidden = true
    }
}
