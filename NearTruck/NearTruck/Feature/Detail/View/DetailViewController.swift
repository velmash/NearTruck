//
//  DetailViewController.swift
//  NearTruck
//
//  Created by 윤형찬 on 2023/08/30.
//

import UIKit
import RxSwift
import RxCocoa

class DetailViewController: BaseViewController {
    private var bag = DisposeBag()
    private let detailView = DetailView()
    
    var coordinator: DetailCoordinator?
    
    override func loadView() {
        view = detailView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailView.actionButton.rx.tap
            .asDriver()
            .drive(onNext: { [weak self] in
                self?.coordinator?.goBack()
            })
            .disposed(by: bag)
    }
}
