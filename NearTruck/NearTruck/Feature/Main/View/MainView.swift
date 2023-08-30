//
//  MainView.swift
//  NearTruck
//
//  Created by 윤형찬 on 2023/08/30.
//

import UIKit
import SnapKit
import Then

class MainView: UIView {
    let titleLabel = UILabel().then {
        $0.text = "Welcome"
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: 14)
    }
    
    let actionButton = UIButton().then {
        $0.setTitle("Click Me", for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 14) // 타이틀 폰트 설정
        $0.setTitleColor(.blue, for: .normal) // 타이틀 색상 설정
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
        
        addSubview(actionButton)
        addSubview(titleLabel)
        
        actionButton.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.size.equalTo(50)
        }
        
        titleLabel.snp.makeConstraints {
            $0.bottom.equalTo(actionButton.snp.top).offset(-20)
            $0.centerX.equalToSuperview()
        }
    }
}
