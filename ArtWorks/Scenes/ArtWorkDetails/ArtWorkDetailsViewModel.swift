//
//  ArtWorkDetailsViewModel.swift
//  ArtWorks
//
//  Created by Azza on 19/11/2021.
//

import Foundation
import RxSwift
import RxRelay

class ArtWorkDetailsViewModel {
    
    private let bag = DisposeBag()
    let isLoadNext = BehaviorRelay<Bool>(value: false)
    let artistInfo = PublishSubject<ArtistData>()
    var lastVisitedArtModel: ArtWorkItem
    
    init(lastVisitedArtModel: ArtWorkItem) {
        self.lastVisitedArtModel = lastVisitedArtModel
        getArtWorkDetails()
    }
    
    private func getArtWorkDetails() {
        NetworkClient.shared.sendRequest(endPoint: .artist(artestId: lastVisitedArtModel.artistID ?? 0), decodingType: Artist.self).subscribe(onNext: { [weak self] (result) in
            guard let self = self, let artistData = result.artistData else { return }
            self.artistInfo.onNext(artistData)
        }).disposed(by: bag)
    }
}
