//
//  SceneDelegate.swift
//  WorldApp
//
//  Created by Настя Сойко on 1.03.21.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let scene = scene as? UIWindowScene else { return }
        let window = UIWindow(frame: scene.coordinateSpace.bounds)
        window.windowScene = scene

        window.rootViewController = UINavigationController(rootViewController: WAInitViewController())

        self.window = window

        window.makeKeyAndVisible()
    }
}
