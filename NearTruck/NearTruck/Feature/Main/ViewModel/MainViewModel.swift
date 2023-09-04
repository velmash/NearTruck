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
    private var selectedTapRelay = BehaviorRelay<SelectedTap>(value: .taco)
    
    var coordinator: MainCoordinator?
    
    func transform(input: Input) -> Output {
        Driver.merge(
            input.foodTruckItemTrigger.map { _ in SelectedTap.taco },
            input.myPageItemTrigger.map { _ in SelectedTap.sundae }
        )
        .drive(onNext: { [weak self] action in
            if self?.selectedTapRelay.value != action {
//                print("HIHI", action)
                self?.selectedTapRelay.accept(action)
            }
        })
        .disposed(by: bag)
        
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
        
        let selectedTapPost = selectedTapRelay.asDriverOnErrorJustComplete()
        
        return Output(selectedTapPost: selectedTapPost)
    }
}

extension MainViewModel {
    struct Input {
        let foodTruckItemTrigger: Driver<Void>
        let myPageItemTrigger: Driver<Void>
        let actionBtnTrigger: Driver<Void>
    }
    struct Output {
        let selectedTapPost: Driver<SelectedTap>
    }
}

extension MainViewModel {
    enum SelectedTap {
        case taco
        case sundae
    }
    enum NaviAction {
        case goDetail
    }
}
