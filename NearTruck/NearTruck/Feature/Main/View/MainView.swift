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
    
    let tacoView = TacoView()
    let tempView = UIView().then {
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
        addSubview(tacoView)
        addSubview(tempView)
        
        tabBar.snp.makeConstraints {
            let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene
            let safeAreaBottom = scene?.windows.first?.safeAreaInsets.bottom ?? 0
            
            let tabBarHeight = 50 + safeAreaBottom
            
            $0.height.equalTo(tabBarHeight)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        
        tacoView.snp.makeConstraints {
            $0.top.left.trailing.equalToSuperview()
            $0.bottom.equalTo(tabBar.snp.top)
        }
        
        tempView.snp.makeConstraints {
            $0.edges.equalTo(tacoView)
        }
    }
}
