//
//  MainView.swift
//  NearTruck
//
//  Created by 윤형찬 on 2023/08/30.
//

import UIKit
import SnapKit
import Then

enum TappedView {
    case taco
    case sundae
}

class MainView: UIView {
    let tabBar = MainTabBar()
    
    let foodTruckView = FoodTruckView()
    let myPageView = UIView().then {
        $0.backgroundColor = .red
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // UI 요소 초기화 및 배치
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        self.backgroundColor = .white
        
        addSubview(tabBar)
        addSubview(foodTruckView)
        addSubview(myPageView)
        
        tabBar.snp.makeConstraints {
            let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene
            let safeAreaBottom = scene?.windows.first?.safeAreaInsets.bottom ?? 0
            
            let tabBarHeight = 50 + safeAreaBottom
            
            $0.height.equalTo(tabBarHeight)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        
        foodTruckView.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide.snp.top)
            $0.left.trailing.equalToSuperview()
            $0.bottom.equalTo(tabBar.snp.top)
        }
        
        myPageView.snp.makeConstraints {
            $0.edges.equalTo(foodTruckView)
        }
    }
}
