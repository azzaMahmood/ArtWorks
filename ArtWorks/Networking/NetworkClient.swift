//
//  NetworkClient.swift
//  ArtWorks
//
//  Created by Azza on 17/11/2021.
//

import Foundation
import RxSwift
import Moya

class NetworkClient {
    
    private init() {}
    
    // MARK: - Properties
    static let shared = NetworkClient()
    lazy var provider = MoyaProvider<ArtWorkService>(plugins: [NetworkLoggerPlugin.init()])
    
    func sendRequest<ResponseType: Decodable>(endPoint: ArtWorkService, decodingType: ResponseType.Type) -> PublishSubject<ResponseType> {
        let responseSubject = PublishSubject<ResponseType>()
        provider.request(endPoint) { result in
            switch result {
            case .success(let moyaResponse):
                do {
                    let model: ResponseType =  try JSONDecoder().decode(decodingType.self, from: moyaResponse.data)
                    responseSubject.onNext(model)
                } catch let error {
                    responseSubject.onError(error)
                }
            case .failure(let error):
                responseSubject.onError(error)
            }
        }
        return responseSubject
    }
    
}
