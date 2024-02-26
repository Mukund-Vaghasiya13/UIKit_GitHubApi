//
//  SceneDelegate.swift
//  GithubApp
//
//  Created by Mukund vaghasiya  on 16/02/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        
        
        
        //MARK: it a instance of our app
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        //MARK: creating Window of size UIWindowScene
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        
        //MARK: placing window on UIwindoWindowScene
        window?.windowScene = windowScene
        //MARK: giving rootViewController to window that that content show on screen
        window?.rootViewController = CreateTabBarController()
        //MARK:  Make the window visible and active on the screen
        window?.makeKeyAndVisible()
    }
    
    //TODO: Reuse CreateSearchNavigationController CreateFravoitNavigationController
    private func CreateSearchNavigationController()-> UINavigationController{
        let SV = SearchVc()
        SV.title = "Search Vc"
        SV.tabBarItem = UITabBarItem(title: "Sv", image:.add, tag: 0)
        return UINavigationController(rootViewController: SV)
        
    }
    
    private func CreateFravoitNavigationController()-> UINavigationController{
        let FV = FavoritListVc()
        FV.title = "Farorit Vc"
        FV.tabBarItem = UITabBarItem(title: "FV", image:.remove, tag: 1)
        return UINavigationController(rootViewController: FV)
    }

    
    private func CreateTabBarController()->UITabBarController{
        let tabbar = UITabBarController()
        UITabBar.appearance().tintColor = .systemRed
        UITabBar.appearance().backgroundColor = .systemBackground
        tabbar.viewControllers = [CreateSearchNavigationController(),CreateFravoitNavigationController()]
        
        return tabbar
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
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

