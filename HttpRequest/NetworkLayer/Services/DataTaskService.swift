//
//  ApiRequest.swift
//  HttpRequest
//
//  Created by Hoorad on 6/28/20.
//  Copyright © 2020 Hoorad. All rights reserved.
//

import Foundation




protocol DataTaskDelegate {
    typealias Response = ((Result<Data,Error>) -> Void)
    func StartDataTask(_ request: URLRequest,completion: @escaping Response)
    func CancelDataTask()
}

final class DataTaskService: DataTaskDelegate{
        
    //MARK: Dependency Injection
    private var session : URLSession
    init(session: URLSession = URLSession.shared) {
        self.session = session
    }
    
    //MARK: Properties
    private var task: URLSessionTask?
    
    //MARK: Start Task
    func StartDataTask(_ request: URLRequest, completion: @escaping Response) {
        
        task = session.dataTask(with: request,
                                completionHandler: { [weak self] (data, response, error) in
            if let error = error {
                completion(.failure(error))
            }
            guard let response = response as? HTTPURLResponse else {
                completion(.failure(HTTPNetworkError.FragmentResponse))
                return
            }
            self?.ValidateResponse(response, data: data) { result in
                completion(result)
            }
        })
        self.task?.resume()
    }
    
    func CancelDataTask() {
        task?.cancel()
    }
    
}

extension DataTaskService{
    private func ValidateResponse(_ Response: HTTPURLResponse,data:Data?,completion:(Result<Data,Error>) -> Void) {
        switch Response.statusCode {
        case 200...299:
            guard let data = data else {
                completion(.failure(HTTPNetworkError.noData))
                return
            }
            completion(.success(data))
        case 401...500:
            completion(.failure(HTTPNetworkError.authenticationError))
        case 600: return
            completion(.failure(HTTPNetworkError.failed))
        default:
            completion(.failure(HTTPNetworkError.badRequest))
        }
    }
}



protocol UploadTaskDelegate {
    func UploadTask(_ request: HTTPRequest,completion: @escaping(Data?, Error?) -> Void)
}
struct UploadTask: UploadTaskDelegate {
    
    func UploadTask(_ request: HTTPRequest, completion: @escaping (Data?, Error?) -> Void) {
        
    }
}
