//
//  ArtWorkListViewModel.swift
//  ArtWorks
//
//  Created by Azza on 17/11/2021.
//

import Foundation
import RxSwift
import RxRelay

class ArtWorkListViewModel {
    
    let artWorkList = BehaviorRelay<[ArtWorkItem]>(value: [])
    let isLoadNext = BehaviorRelay<Bool>(value: false)
    var imageBaseUrl = ""

    private var currentPage = 0
    private(set) var items: [ArtWorkItem] = []
    private(set) var currentItemsCount: Int = 0
    private(set) var totalArtWorks = 0
    private let bag = DisposeBag()
    
    init() {
        configureBinding()
        getArtWorksList()
    }
    
    private func configureBinding() {
        isLoadNext.subscribe(onNext: { [weak self] loadNext in
            guard let self = self else { return }
            if loadNext {
                self.currentPage += 1
                self.getArtWorksList()
            }
        }).disposed(by: bag)
    }
    
    func getArtWorksList() {
        NetworkClient.shared.sendRequest(endPoint: .artworks(page: currentPage),
                                          decodingType: ArtWorkResponse.self).subscribe(onNext: { [weak self] (result) in
                                            guard let self = self else { return }
                                            print("eeee\(result)")
                                            self.items.append(contentsOf: result.artWorkList ?? [])
                                            self.currentItemsCount = self.items.count
                                            self.artWorkList.accept(self.items)
                                            self.imageBaseUrl = result.config?.iiifURL ?? ""
                                            self.totalArtWorks = result.pagination?.total ?? 0
                                          }).disposed(by: bag)
    }
}
