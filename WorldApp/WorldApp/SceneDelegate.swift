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

        self.setUpNavBarAppearance()

        window.makeKeyAndVisible()
    }

    func setUpNavBarAppearance() {
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        navBarAppearance.backgroundColor = .white
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.systemTeal]

        let buttonStyle = UIBarButtonItemAppearance(style: .done)
        buttonStyle.normal.titleTextAttributes = [.foregroundColor: UIColor.red]
        navBarAppearance.doneButtonAppearance = buttonStyle

//        UINavigationBar.appearance().tintColor = .purple
        UINavigationBar.appearance().standardAppearance = navBarAppearance
//        UINavigationBar.appearance().backgroundColor = .purple //barTintColor вместо backgroundColor
        UINavigationBar.appearance().isTranslucent = true //  прозрачный
        UINavigationBar.appearance().tintColor = .magenta
        UINavigationBar.appearance().barStyle = .black
    }

    func changeRootViewController(_ vc: UIViewController, animated: Bool = true) {
        guard let window = self.window else { return }

        window.rootViewController = vc

        if animated {
            UIView.transition(with: window,
                              duration: 0.5,
                              options: .transitionFlipFromTop,
                              animations: nil)
        }
    }
}
