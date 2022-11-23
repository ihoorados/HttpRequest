//
//  Apis.swift
//  HttpRequest
//
//  Created by Hoorad on 6/29/20.
//  Copyright © 2020 Hoorad. All rights reserved.
//

import Foundation


protocol RepositoryDelegate:AnyObject {
    typealias response = ((Result<[CatFactModel],Error>) -> Void)
    func Request(for endPoint: NetworkEndPoint, completion:  @escaping response)
    func cancelRequest()
}

class MainRepository: RepositoryDelegate {
    
    typealias response = ((Result<[CatFactModel],Error>) -> Void)
    private var Service:DataTaskDelegate
    init(service:DataTaskDelegate = DataTaskService()) {
        Service = service
    }
    
    func Request(for endPoint:NetworkEndPoint,completion: @escaping response){
       
        /* We Can Chose What kind of request we can do
                1. Rest Api Network
                2. Cash or data base
                3. FireBase or other third party
        */
        RequestOverNetwork(api: endPoint) { response in
            completion(response)
        }
    }
    
    func cancelRequest() {
        Service.CancelDataTask()
    }
    
    // MARK: - Request Over the Network
    private func RequestOverNetwork(api:NetworkEndPoint,completion: @escaping response){
        guard let url = api.baseURL else {
            completion(.failure(NetworkError.missingURL))
            return
        }
        let request = api.buildURLRequest(with: url)
        Service.StartDataTask(request) { result in
            switch result{
                case .success(let responseData):
                    self.JSONSerializationWith(data: responseData) { result in
                        completion(result)
                    }
                case .failure(let err):
                    completion(.failure(err))
            }
        }
    }
    
    // Mark: - Decode Profile Data And Update Status
    private func JSONSerializationWith(data: Data,completion: response) {
        do {
            let DataModel = try JSONDecoder()
                .decode([FailableDecodable<CatFactModel>].self, from: data)
                .compactMap { $0.base }
            completion(.success(DataModel))
        } catch let jsonError as NSError {
          print("JSON decode failed: \(jsonError.localizedDescription)")
            completion(.failure(jsonError))
        }
    }
    
}
