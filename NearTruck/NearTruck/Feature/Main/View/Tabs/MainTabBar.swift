//
//  MainTabBar.swift
//  NearTruck
//
//  Created by 윤형찬 on 2023/09/04.
//

import UIKit
import SnapKit
import Then
import RxSwift
import RxCocoa
import RxGesture

class MainTabBar: UIView {
    private let disposeBag = DisposeBag()
    
    let itemStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.spacing = 10
        $0.distribution = .fillEqually
    }
    
    let foodTruckTabItem = TabItem()
    let myPageTabItem = TabItem()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        self.backgroundColor = .white
        setShadow()
        setItems()
        
        addSubview(itemStackView)
        itemStackView.addArrangedSubview(foodTruckTabItem)
        itemStackView.addArrangedSubview(myPageTabItem)
        
        itemStackView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(50)
        }
        
        bindRx()
    }
    
    private func setShadow() {
        self.clipsToBounds = false
        
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.3
        self.layer.shadowOffset = CGSize(width: 0, height: 2)
        self.layer.shadowRadius = 4
    }
    
    private func setItems() {
        foodTruckTabItem.setItem(imgName: "loacon", title: "푸드트럭", isSelected: true)
        myPageTabItem.setItem(imgName: "mantis", title: "마이", isSelected: false)
    }
    
    private func bindRx() {
        let tabItems = [foodTruckTabItem, myPageTabItem]
        
        tabItems.forEach { tabItem in
            tabItem.rx.tapGesture()
                .when(.recognized)
                .subscribe(onNext: { _ in
                    tabItems.forEach { $0.isSelected = ($0 == tabItem) }
                })
                .disposed(by: disposeBag)
        }
    }
}
