//
//  ViewModelType.swift
//  NearTruck
//
//  Created by 윤형찬 on 2023/08/30.
//

import Foundation

protocol ViewModelType {
    associatedtype Input
    associatedtype Output
    
    func transform(input: Input) -> Output
}
