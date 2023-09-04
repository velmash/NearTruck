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
    
    var foodType: FoodType?
    var viewModel: DetailViewModel?
    
    override func loadView() {
        view = detailView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bindViewModel()
        detailView.titleLabel.text = foodType?.rawValue
    }
    
    private func bindViewModel() {
        guard let viewModel = self.viewModel else { return }
        
        let input = DetailViewModel.Input(
            backBtnTrigger: detailView.actionButton.rx.tap.asDriver()
        )
        
        let output = viewModel.transform(input: input)
    }
}
