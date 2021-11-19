//
//  HistoryViewModel.swift
//  ArtWorks
//
//  Created by Azza on 19/11/2021.
//

import Foundation
import RxSwift
import RxRelay

class HistoryViewModel {
    
    let artWorkList = BehaviorRelay<[ArtWorkItem]>(value: [])

    
}
