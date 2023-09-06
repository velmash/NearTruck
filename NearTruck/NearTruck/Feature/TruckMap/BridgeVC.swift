//
//  TestViewController.swift
//  NearTruck
//
//  Created by 윤형찬 on 2023/09/06.
//

import SwiftUI
import UIKit
import SnapKit

class BridgeVC: UIViewController {
    var viewModel: TruckMapViewModel
    
    init(viewModel: TruckMapViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let testView = TruckMapViewController(viewModel: viewModel)
        let hostingController = UIHostingController(rootView: testView)
        
        addChild(hostingController)
        view.addSubview(hostingController.view)
        
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        
        hostingController.view.snp.makeConstraints {
            $0.edges.equalTo(self.view)
        }
        
        hostingController.didMove(toParent: self)
    }
}
