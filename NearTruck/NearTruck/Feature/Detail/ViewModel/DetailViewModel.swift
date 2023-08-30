//
//  DetailViewModel.swift
//  NearTruck
//
//  Created by 윤형찬 on 2023/08/30.
//

import RxSwift
import RxCocoa

class DetailViewModel: ViewModelType {
    private var bag = DisposeBag()
    
    var coordinator: DetailCoordinator?
    
    func transform(input: Input) -> Output {
        Driver.merge(
            input.backBtnTrigger.map { _ in NaviAction.goBack }
        )
        .throttle(.milliseconds(500), latest: false)
        .drive(onNext: { [weak self] action in
            switch action {
            case .goBack:
                self?.coordinator?.goBack()
            }
        })
        .disposed(by: bag)
        
        return Output()
    }
}

extension DetailViewModel {
    struct Input {
        let backBtnTrigger: Driver<Void>
    }
    struct Output { }
}

extension DetailViewModel {
    enum NaviAction {
        case goBack
    }
}
