//
//  TacoView.swift
//  NearTruck
//
//  Created by 윤형찬 on 2023/09/04.
//

import UIKit

class FoodTruckView: UIView {
    var foodItems: [Food]?
    
    let itemCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    let titleLabel = UILabel().then {
        $0.text = "어떤 트럭 볼래?"
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: 28)
    }
    
    let actionButton = UIButton().then {
        $0.setTitle("Click Me", for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 14) // 타이틀 폰트 설정
        $0.setTitleColor(.blue, for: .normal) // 타이틀 색상 설정
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        setupCollectionView()
        
        addSubview(titleLabel)
        addSubview(actionButton)
        
        titleLabel.snp.makeConstraints {
            $0.bottom.equalTo(itemCollectionView.snp.top).offset(-20)
            $0.leading.equalTo(itemCollectionView.snp.leading)
        }
        
        actionButton.snp.makeConstraints {
            $0.leading.equalTo(titleLabel)
            $0.top.equalTo(itemCollectionView.snp.bottom).offset(15)
            $0.size.equalTo(50)
        }
    }
    
    private func setupCollectionView() {
        itemCollectionView.dataSource = self
        itemCollectionView.delegate = self
        
        itemCollectionView.register(ItemCollectionViewCell.self, forCellWithReuseIdentifier: "ItemCollectionViewCell")
        
        let layout = itemCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.minimumInteritemSpacing = 10 // 아이템 간의 가로 간격
        layout.scrollDirection = .horizontal
        
        addSubview(itemCollectionView)
        
        itemCollectionView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.height.equalTo(150)
            $0.width.equalTo(310)
        }
    }
}

extension FoodTruckView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let foodItems = self.foodItems else { return 0 }
        return foodItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemCollectionViewCell", for: indexPath) as! ItemCollectionViewCell
        
        if let foodItems {
            cell.configCell(food: foodItems[indexPath.row])
        }
        
        return cell
    }
}

extension FoodTruckView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 150)
    }
}
