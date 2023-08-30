//
//  MainViewController.swift
//  NearTruck
//
//  Created by 윤형찬 on 2023/08/30.
//

import UIKit
import RxSwift
import RxCocoa

class MainViewController: UIViewController {
    private var bag = DisposeBag()
    private let mainView = MainView()
    
    var coordinator: MainCoordinator?
    
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        mainView.actionButton.rx.tap
            .asDriver()
            .drive(onNext: { [weak self] in
                self?.coordinator?.goDetail()
            })
            .disposed(by: bag)
    }
}
