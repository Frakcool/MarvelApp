//
//  SceneDelegate.swift
//  MarvelApp
//
//  Created by Jesús Sánchez on 26/06/21.
//

import UIKit
import Presentation

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        /*guard let windowScene = (scene as? UIWindowScene) else { return }

        let homeRouter = HomeRouter.start()
        let initialVC = homeRouter.entry

        let navigationController = UINavigationController(rootViewController: initialVC!)

        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        self.window = window*/

        guard let windowScene = (scene as? UIWindowScene) else { return }
        let initialVC = HomeViewController()

        let navigationController = UINavigationController(rootViewController: initialVC)

        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        self.window = window

    }

    func sceneDidDisconnect(_ scene: UIScene) {

    }

    func sceneDidBecomeActive(_ scene: UIScene) {

    }

    func sceneWillResignActive(_ scene: UIScene) {

    }

    func sceneWillEnterForeground(_ scene: UIScene) {

    }

    func sceneDidEnterBackground(_ scene: UIScene) {

    }
}

