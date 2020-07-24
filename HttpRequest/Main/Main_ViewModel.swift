//
//  MainViewModel.swift
//  HttpRequest
//
//  Created by Hoorad on 6/29/20.
//  Copyright © 2020 Hoorad. All rights reserved.
//

import Foundation


struct MainViewModel {
    
    var service : ServiceController = ServiceController()
    
    func fetch(completion: @escaping (String) -> Void){
        
        service.RequestFor(api: .Feed) { (data, err) in
            if let err = err {
                completion(err.localizedDescription)
            }else if let data = data{
                completion(data.description)
            }
        }
    }
}
