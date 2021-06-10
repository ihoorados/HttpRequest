//
//  Apis.swift
//  HttpRequest
//
//  Created by Hoorad on 6/29/20.
//  Copyright © 2020 Hoorad. All rights reserved.
//

import Foundation


protocol RepositoryDelegate {
    typealias response = ((Result<[String:Any],Error>) -> Void)
    func RequestFor(api: CatFactApi, completion:  @escaping response)
    func cancelRequest()
}

struct Main_Repository: RepositoryDelegate {
    
    typealias response = ((Result<[String:Any],Error>) -> Void)
    private var ServiceShared:DataTaskService
    init(service:DataTaskService = DataTaskService(session: URLSession.shared)) {
        ServiceShared = service
    }
    
    func RequestFor(api:CatFactApi,completion: @escaping response){
        do {
            let request = try api.buildURLRequest()
            StartRequest(with: request, completion: { result in
                completion(result)
            })
        } catch  {
            print("faild")
        }
    }
    
    
    fileprivate func StartRequest(with request:URLRequest,
                                  completion: @escaping response){
        ServiceShared.StartDataTask(request) { result in
            switch result{
            case .success(let data):
                JSONSerializationWith(data) { result in
                    completion(result)
                }
            case .failure(let err):
                print(err)
            }
        }
    }
    
    func cancelRequest() {
        ServiceShared.CancelDataTask()
    }

    
    
    private func JSONSerializationWith(_ data: Data,completion: @escaping response) {
        do {
            // make sure this JSON is in the format we expect
            let jsonData = try JSONSerialization.jsonObject(with: data,
                                                            options: .mutableContainers) as! [String : Any]
            completion(.success(jsonData))
        } catch let error as NSError {
            completion(.failure(error))
        }
        
    }
    
}
