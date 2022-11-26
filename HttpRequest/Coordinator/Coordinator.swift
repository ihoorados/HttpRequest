//
//  Coordinator.swift
//  HttpRequest
//
//  Created by Hoorad Ramezani on 25/11/2022.
//  Copyright © 2022 Hoorad. All rights reserved.
//

import Foundation
import UIKit

protocol Coordinator {
    func startMainApplication()
}
class AppCoordinator: Coordinator{

    /* ------------------------------- */
    // MARK: Dependency Injection
    /* ------------------------------- */

    private let window: UIWindow

    init(window: UIWindow) {

        self.window = window
        self.window.makeKeyAndVisible()
    }

    /* ------------------------------- */
    // MARK: Public Functions
    /* ------------------------------- */

    func startMainApplication() {

        let rootVC = MainView()
        self.window.rootViewController = rootVC
    }

}
