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
    private var selectedTapRelay = BehaviorRelay<SelectedTap>(value: .foodTruck)
    private let foodTypeMapping: [NaviAction] = [
        .goTaco,
        .goSundae
    ]
    var coordinator: MainCoordinator?
    
    func transform(input: Input) -> Output {
        Driver.merge(
            input.foodTruckItemTrigger.map { _ in SelectedTap.foodTruck },
            input.myPageItemTrigger.map { _ in SelectedTap.myPage }
        )
        .drive(onNext: { [weak self] action in
            if self?.selectedTapRelay.value != action {
                self?.selectedTapRelay.accept(action)
            }
        })
        .disposed(by: bag)
        
        Driver.merge(
            input.selectedFoodType.map { [weak self] index -> NaviAction in
                guard let self = self else { return .fail }
                guard index >= 0, index < foodTypeMapping.count else {
                    return .fail
                }
                return foodTypeMapping[index]
            },
            input.actionBtnTrigger.map { _ in NaviAction.fail }
        )
        .throttle(.milliseconds(500), latest: false)
        .drive(onNext: { [weak self] action in
            switch action {
            case .goTaco:
                self?.coordinator?.goDetail(type: .taco)
            case .goSundae:
                self?.coordinator?.goDetail(type: .sundae)
            default:
                print("ZSDF")
            }
        })
        .disposed(by: bag)
        
        let foodTypeObservable = Observable<[Food]>.create { observer in
            let foods: [Food] = [
                Food(title: "타코야키", image: UIImage(named: "taco")),
                Food(title: "순대", image: UIImage(named: "sundae"))
            ]
            
            observer.onNext(foods)
            
            return Disposables.create()
        }
        
        let foodTypePost = foodTypeObservable.asDriverOnErrorJustComplete()
        let selectedTapPost = selectedTapRelay.asDriverOnErrorJustComplete()
        
        return Output(selectedTapPost: selectedTapPost, foodTypePost: foodTypePost)
    }
}

extension MainViewModel {
    struct Input {
        let foodTruckItemTrigger: Driver<Void>
        let myPageItemTrigger: Driver<Void>
        let selectedFoodType: Driver<Int>
        let actionBtnTrigger: Driver<Void>
    }
    struct Output {
        let selectedTapPost: Driver<SelectedTap>
        let foodTypePost: Driver<[Food]>
    }
}

extension MainViewModel {
    enum SelectedTap {
        case foodTruck
        case myPage
    }
    
    enum NaviAction {
        case goTaco
        case goSundae
        case fail
    }
}

struct Food {
    let title: String
    let image: UIImage?
}
