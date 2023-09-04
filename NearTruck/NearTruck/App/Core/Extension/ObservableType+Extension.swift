//
//  ObservableType+Extension.swift
//  NearTruck
//
//  Created by 윤형찬 on 2023/09/04.
//

import RxSwift
import RxCocoa

import RxSwift
import RxCocoa

public extension ObservableType {
    func doOnNext(_ onNext: @escaping (Element) throws -> Void) -> Observable<Element> {
        return self.do(onNext: onNext)
    }

    func doOnError(_ onError: @escaping (Swift.Error) throws -> Void) -> Observable<Element> {
        return self.do(onError: onError)
    }
    
    func doOnCompleted(_ onCompleted: @escaping () throws -> Void) -> Observable<Element> {
        return self.do(onCompleted: onCompleted)
    }

    func subscribeNext(_ onNext: @escaping (Element) -> Void) -> Disposable {
        return self.subscribe(onNext: onNext)
    }

    func subscribeError(_ onError: @escaping (Swift.Error) -> Void) -> Disposable {
        return self.subscribe(onError: onError)
    }

    func subscribeCompleted(_ onCompleted: @escaping () -> Void) -> Disposable {
        return self.subscribe(onCompleted: onCompleted)
    }
}

extension ObservableType {
    
    func catchErrorJustComplete() -> Observable<Element> {
        return `catch` { _ in
            return Observable.empty()
        }
    }
    
    func asDriverOnErrorJustComplete() -> Driver<Element> {
        return asDriver { error in
            return Driver.empty()
        }
    }
    
    func mapToVoid() -> Observable<Void> {
        return map { _ in }
    }
}

