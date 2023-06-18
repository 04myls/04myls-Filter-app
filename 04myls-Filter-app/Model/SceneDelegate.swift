//
//  SceneDelegate.swift
//  04myls-Filter-app
//
//  Created by 04myls on R 5/06/18.
//

import Foundation
import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = UIHostingController(rootView: FilterContentView())
            self.window = window
            window.makeKeyAndVisible()
        }
    }
}
