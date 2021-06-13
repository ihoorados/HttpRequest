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
        NetworkLogger.log(request: request)
        task = session.dataTask(with: request,
                                completionHandler: { [weak self] (data, response, error) in
                                    
            // 1. Check error
            if let error = error {
                completion(.failure(error))
            }
            
            // 2. Check response
            guard let response = response as? HTTPURLResponse else {
                completion(.failure(NetworkError.FragmentResponse))
                return
            }
                                    
            // 3. Validate Response
            self?.ValidateResponse(response, data: data) { result in
                completion(result)
            }
        })
        task?.resume()
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
                completion(.failure(NetworkError.noData))
                return
            }
            completion(.success(data))
        case 401...500:
            completion(.failure(NetworkError.authenticationError))
        case 600:
            completion(.failure(NetworkError.failed))
        default:
            completion(.failure(NetworkError.serverSideError))
        }
    }
}
