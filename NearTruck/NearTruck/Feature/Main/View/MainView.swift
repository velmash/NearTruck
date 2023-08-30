//
//  MainView.swift
//  NearTruck
//
//  Created by 윤형찬 on 2023/08/30.
//

import UIKit

class MainView: UIView {
    let titleLabel: UILabel
    let actionButton: UIButton
    
    override init(frame: CGRect) {
        titleLabel = UILabel()
        actionButton = UIButton()
        
        super.init(frame: frame)
        
        // UI 요소 초기화 및 배치
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        self.backgroundColor = .white
        
        // titleLabel 설정
        titleLabel.text = "Welcome"
        // ...

        // actionButton 설정
        actionButton.setTitle("Click Me", for: .normal)
        actionButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        // ...
        
        // UI 요소들을 View에 추가
        addSubview(titleLabel)
        addSubview(actionButton)
        
        // AutoLayout 설정 등
        // ...
    }
    
    @objc private func buttonTapped() {
        // 버튼 클릭 처리 로직
    }
}
