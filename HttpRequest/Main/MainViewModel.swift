//
//  MainViewModel.swift
//  HttpRequest
//
//  Created by Hoorad on 6/29/20.
//  Copyright © 2020 Hoorad. All rights reserved.
//

import Foundation


struct MainViewModel {
    
    
    var api : ServiceController = ServiceController()
        
    func fetch(){
        
        api.MakeRequestFor(api: .Feed) { (data, err) in
            print("don")
        }
        
    }
}
