//
//  TabItem.swift
//  NearTruck
//
//  Created by 윤형찬 on 2023/09/04.
//

import UIKit

class TabItem: UIView {
    var isSelected: Bool = false {
        didSet {
            self.selector.isHidden = !isSelected
        }
    }
    
    var selector = UIView().then {
        $0.backgroundColor = .blue
    }
    
    var icon = UIImageView().then {
        $0.contentMode = .scaleAspectFit
    }
    
    var title = UILabel().then {
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: 10)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        self.backgroundColor = .clear
        
        addSubview(icon)
        addSubview(title)
        addSubview(selector)
        
        icon.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.size.equalTo(15)
            $0.centerX.equalToSuperview()
        }
        
        title.snp.makeConstraints {
            $0.top.equalTo(icon.snp.bottom).offset(5)
            $0.centerX.equalTo(icon)
        }
        
        selector.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.height.equalTo(2)
            $0.width.equalTo(icon).multipliedBy(2)
            $0.centerX.equalTo(icon)
        }
    }
    
    func setItem(imgName: String, title: String, isSelected: Bool) {
        self.icon.image = UIImage(named: imgName)
        self.title.text = title
        self.isSelected = isSelected
    }
}
