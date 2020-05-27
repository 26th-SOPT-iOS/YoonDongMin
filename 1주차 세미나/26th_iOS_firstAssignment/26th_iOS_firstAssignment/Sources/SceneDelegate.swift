//
//  SceneDelegate.swift
//  26th_iOS_firstAssignment
//
//  Created by 윤동민 on 2020/03/27.
//  Copyright © 2020 윤동민. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
//        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            self.window = window
            window.makeKeyAndVisible()
            guard let pair: (id: String,pwd: String) = DataHandler.shared.load() else {
                let startStoryboard = UIStoryboard(name: "Main", bundle: nil)
                guard let startController = startStoryboard.instantiateViewController(identifier: "customNavigationController") as? UINavigationController else { return }
                window.rootViewController = startController
                return
            }
            LoginService.shared.login(id: pair.id, pwd: pair.pwd, completion: logicLogin)
        }
        guard let _ = (scene as? UIWindowScene) else { return }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

extension SceneDelegate: LoginAble {
    var logicLogin: (NetworkResult<Any>) -> Void {
        return { (networkResult) in
            let startStoryBoard = UIStoryboard(name: "Main", bundle: nil)
            switch networkResult {
            case .success(let token):
                guard let token = token as? String else { return }
                UserDefaults.standard.set(token, forKey: "token")
                guard let startController = startStoryBoard.instantiateViewController(identifier: "customTabbarController") as? UITabBarController else { return }
                self.window?.rootViewController = startController
            default:
                let alertController = UIAlertController(title: "네트워크 오류", message: "인터넷 연결을 해주세요", preferredStyle: .alert)
                let alertAction = UIAlertAction(title: "확인", style: .cancel, handler: nil)
                alertController.addAction(alertAction)
                guard let startController = startStoryBoard.instantiateViewController(identifier: "customNavigationController") as? UINavigationController else { return }
                self.window?.rootViewController = startController
//                self.window?.rootViewController?.present(alertController, animated: true, completion: nil)
            }
        }
        ()
    }
}
