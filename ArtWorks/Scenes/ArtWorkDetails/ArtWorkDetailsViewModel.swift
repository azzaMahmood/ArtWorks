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
    var currentArtWorkModel: ArtWorkItem
    
    init(currentArtWorkModel: ArtWorkItem) {
        self.currentArtWorkModel = currentArtWorkModel
        getArtWorkDetails()
    }
    
    private func getArtWorkDetails() {
        NetworkClient.shared.sendRequest(endPoint: .artist(artestId: currentArtWorkModel.artistID ?? 0), decodingType: Artist.self).subscribe(onNext: { [weak self] (result) in
            guard let self = self, let artistData = result.artistData else { return }
            self.artistInfo.onNext(artistData)
        }).disposed(by: bag)
    }
    
    func getBase64String() -> String {
        guard let wholeBase64String = currentArtWorkModel.thumbnail?.lqip else { return  ""}
        let index = wholeBase64String.index(after: wholeBase64String.firstIndex(of: ",") ?? wholeBase64String.startIndex)
        let base64SubString = wholeBase64String.substring(from: index)
        return String(base64SubString)
    }
    
}
