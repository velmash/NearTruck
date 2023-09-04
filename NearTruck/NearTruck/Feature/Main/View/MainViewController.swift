//
//  MainViewController.swift
//  NearTruck
//
//  Created by 윤형찬 on 2023/08/30.
//

import UIKit
import RxSwift
import RxCocoa

class MainViewController: BaseViewController {
    private var bag = DisposeBag()
    private let mainView = MainView()
    
    var viewModel: MainViewModel?
    
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bindViewModel()
    }
    
    private func bindViewModel() {
        guard let viewModel = self.viewModel else { return }
        
        let foodTruckItemSelection = mainView.foodTruckView.itemCollectionView.rx.itemSelected
            .map { indexPath in indexPath.row }
            .asDriverOnErrorJustComplete()
        
        let input = MainViewModel.Input(
            foodTruckItemTrigger: mainView.tabBar.foodTruckTabItem.rx.tapGesture().when(.recognized).map { _ in () }.asDriverOnErrorJustComplete(),
            myPageItemTrigger: mainView.tabBar.myPageTabItem.rx.tapGesture().when(.recognized).map { _ in () }.asDriverOnErrorJustComplete(),
            selectedFoodType: foodTruckItemSelection,
            actionBtnTrigger: mainView.foodTruckView.actionButton.rx.tap.asDriver()
        )
        
        let output = viewModel.transform(input: input)

        output.selectedTapPost
            .drive(onNext: { [weak self] _ in
                guard let self = self else { return }
                self.mainView.foodTruckView.isHidden = !self.mainView.tabBar.foodTruckTabItem.isSelected
                self.mainView.myPageView.isHidden = !self.mainView.tabBar.myPageTabItem.isSelected
            })
            .disposed(by: bag)
        
        output.foodTypePost
            .drive(onNext: { [weak self] items in
                self?.mainView.foodTruckView.foodItems = items
            })
            .disposed(by: bag)
    }
}
