//
//  MyPageView.swift
//  NearTruck
//
//  Created by 윤형찬 on 2023/09/04.
//

import UIKit
import Then
import SnapKit

class MyPageView: UIView {
    let titleLb = UILabel().then {
        $0.text = "마이 페이지"
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: 24)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        self.backgroundColor = .white
        
        addSubview(titleLb)
        
        titleLb.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide.snp.top)
            $0.leading.equalToSuperview().offset(10)
        }
    }
}
