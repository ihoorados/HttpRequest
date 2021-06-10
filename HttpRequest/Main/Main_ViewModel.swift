//
//  MainViewModel.swift
//  HttpRequest
//
//  Created by Hoorad on 6/29/20.
//  Copyright © 2020 Hoorad. All rights reserved.
//

import Foundation


class MainViewModel {
    
    //MARK: Exposable Properties
    var dataModel: [CatFactModel] = [CatFactModel]()

    //MARK: Dependency injection
    private var repos : Main_Repository
    init(repos:Main_Repository = Main_Repository()) {
        self.repos = repos
    }
    
    func fetch(){
        repos.Request(for: FactApiList.facts) { [weak self] Result in
            switch Result{
            case .success(let data):
                self?.dataModel.append(contentsOf: data)
                data.forEach { fact in
                    print(fact)
                }
            case .failure(let err):
                print(err)
            }
        }
    }
    
    func cancelFetch(){
        repos.cancelRequest()
    }
}
