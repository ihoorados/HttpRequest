//
//  MainViewModel.swift
//  HttpRequest
//
//  Created by Hoorad on 6/29/20.
//  Copyright © 2020 Hoorad. All rights reserved.
//

import Foundation


struct MainViewModel {
    
    typealias response = ((Result<[String:Any],Error>) -> Void)

    var repos : Main_Repository
    init(repos:Main_Repository = Main_Repository()) {
        self.repos = repos
    }
    
    func fetch(){
        repos.RequestFor(api: .facts) { Result in
            switch Result{
            case .success(let data):
                print(data)
            case .failure(let err):
                print(err)
            }
        }
    }
    
    func cancelFetch(){
        repos.cancelRequest()
    }
}
