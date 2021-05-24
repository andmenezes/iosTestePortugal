//
//  AppDelegate.swift
//  iosTestePortugal
//
//  Created by André Menezes on 19/05/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        let window = UIWindow(frame: UIScreen.main.bounds)
        window.backgroundColor = .white
        window.makeKeyAndVisible()

        let homeWirefrane: HomeWireframeProtocol = HomeWireframe()
        homeWirefrane.showHome(with: window)

        self.window = window
        
        return true
    }
}

