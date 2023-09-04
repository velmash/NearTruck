//
//  ItemCollectionViewCell.swift
//  NearTruck
//
//  Created by 윤형찬 on 2023/09/04.
//

import UIKit
import Then
import SnapKit

class ItemCollectionViewCell: UICollectionViewCell {
    let bgView = UIView().then {
        $0.backgroundColor = .lightGray
    }
    let image = UIImageView().then {
        $0.contentMode = .scaleAspectFit
    }
    
    let titleLabel = UILabel().then {
        $0.textAlignment = .center
        $0.font = UIFont.systemFont(ofSize: 16)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
       
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        self.backgroundColor = .clear
        
        contentView.addSubview(bgView)
        bgView.addSubview(image)
        bgView.addSubview(titleLabel)
        
        bgView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        image.snp.makeConstraints {
            $0.size.equalTo(80)
            $0.top.equalToSuperview().offset(15)
            $0.centerX.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(image.snp.bottom).offset(10)
            $0.centerX.equalTo(image)
        }
    }
    
    func configCell(food: Food) {
        self.image.image = food.image
        self.titleLabel.text = "\(food.title) 보기"
    }
}
