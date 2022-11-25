//
//  Coordinator.swift
//  HttpRequest
//
//  Created by Hoorad Ramezani on 25/11/2022.
//  Copyright © 2022 Hoorad. All rights reserved.
//

import Foundation
import UIKit

protocol Coordinator {}
class AppCoordinator: Coordinator{

    /* ------------------------------- */
    // MARK: Dependency Injection
    /* ------------------------------- */

    private let window: UIWindow

    init(window: UIWindow) {

        self.window = window
        self.window.rootViewController = MainView()
    }
    
}
