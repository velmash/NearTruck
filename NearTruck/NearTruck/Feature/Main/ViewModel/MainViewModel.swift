//
//  MainViewModel.swift
//  NearTruck
//
//  Created by 윤형찬 on 2023/08/30.
//

import RxSwift
import RxCocoa

class MainViewModel: ViewModelType {
    private var bag = DisposeBag()
    
    var coordinator: MainCoordinator?
    
    func transform(input: Input) -> Output {
        Driver.merge(
            input.actionBtnTrigger.map { _ in NaviAction.goDetail }
        )
        .throttle(.milliseconds(500), latest: false)
        .drive(onNext: { [weak self] action in
            switch action {
            case .goDetail:
                self?.coordinator?.goDetail()
            }
        })
        .disposed(by: bag)
        
        return Output()
    }
}

extension MainViewModel {
    struct Input {
        let actionBtnTrigger: Driver<Void>
    }
    struct Output { }
}

extension MainViewModel {
    enum NaviAction {
        case goDetail
    }
}
