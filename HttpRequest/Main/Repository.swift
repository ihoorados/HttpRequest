//
//  Apis.swift
//  HttpRequest
//
//  Created by Hoorad on 6/29/20.
//  Copyright © 2020 Hoorad. All rights reserved.
//

import Foundation

enum ApisList{
    case Feed
    var Request : HTTPRequest {
        switch self {
        case .Feed:
            var feedRequest = HTTPRequest()
            feedRequest.method = HTTPMethod.get.rawValue
            feedRequest.path = "/facts"
            feedRequest.scheme = "https"
            feedRequest.host = "cat-fact.herokuapp.com"
            feedRequest.headers = HTTPHeaders(["Content-Type":"application/json"])
            return feedRequest
        }
    }
}

protocol RepositoryDelegate {
    func RequestFor(api: ApisList, completion: @escaping ([String : Any]?, Error?) -> Void)
}

struct Repository: RepositoryDelegate {
    
    var ServiceShared : DataTaskService = {
        let service = DataTaskService(session: URLSession.shared)
        return service
    }()
    
    var tools : ServiceNetworkTools = {
        let tools = ServiceNetworkTools()
        return tools
    }()
    
    func RequestFor(api:ApisList,completion: @escaping ([String : Any]?, Error?) -> Void){
        guard let request = createRequest(api: api) else {
            return
        }
        ServiceShared.StartDataTask(request) { result in
            switch result{
            case .success(let data):
                print(data)
                JSONSerializationWith(data)
            case .failure(let err):
                print(err)
            }
        }
    }
    
    func createRequest(api:ApisList) -> URLRequest? {
        do {
            let request = try tools.configureRequestForDataTask(api.Request)
            return request
        }catch{
            return nil
        }
    }
    
    private func JSONSerializationWith(_ data: Data) {
        do {
            // make sure this JSON is in the format we expect
            let jsonData = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
            print(jsonData)
        } catch let error as NSError {
            print(error)
        }
        
    }
    
}
