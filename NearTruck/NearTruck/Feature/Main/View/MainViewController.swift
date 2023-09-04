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
        let input = MainViewModel.Input(
            firstItemTrigger: mainView.tabBar.firstTabItem.rx.tapGesture().when(.recognized).map { _ in () }.asDriverOnErrorJustComplete(),
            secondItemTrigger: mainView.tabBar.secondTabItem.rx.tapGesture().when(.recognized).map { _ in () }.asDriverOnErrorJustComplete(),
            actionBtnTrigger: mainView.tacoView.actionButton.rx.tap.asDriver()
        )
        
        let output = viewModel.transform(input: input)
        
        output.selectedTapPost
            .drive(onNext: { [weak self] _ in
                guard let self = self else { return }
                self.mainView.tacoView.isHidden = !self.mainView.tabBar.firstTabItem.isSelected
                self.mainView.tempView.isHidden = !self.mainView.tabBar.secondTabItem.isSelected
            })
            .disposed(by: bag)
    }
}
