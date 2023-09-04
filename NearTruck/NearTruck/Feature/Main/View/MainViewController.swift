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
            actionBtnTrigger: mainView.tacoView.actionButton.rx.tap.asDriver()
        )
        
        let output = viewModel.transform(input: input)
    }
}
