//
//  SceneDelegate.swift
//  BlockView
//
//  Created by Adriano-R Vieira on 29/01/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    fileprivate let type: EffectType = .blur

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let ws = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: ws)
        window?.rootViewController = ViewController()

        window?.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {

    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        showScreen(with: type)
    }

    func sceneWillResignActive(_ scene: UIScene) {
        hideScreen(with: type)
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        showScreen(with: type)
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        hideScreen(with: type)
    }

}

// MARK: - Background effects

private extension SceneDelegate {
    enum EffectType {
        case blur
        case anotherView
    }

    private func hideScreen(with type: EffectType) {
        switch type {
        case .blur:
            createBlurInView()
        case .anotherView:
            createBlockingView()
        }
    }

    private func showScreen(with type: EffectType) {
        switch type {
        case .blur:
            removerBlurInView()
        case .anotherView:
            removeBlockingView()

        }
    }

    private func createBlockingView() {
        guard let rootViewController = window?.rootViewController else { return }

        let blockView = BlockView(frame: UIScreen.main.bounds)
        blockView.tag = 123

        rootViewController.view.addSubview(blockView)
    }

    private func removeBlockingView() {
        guard let rootViewController = window?.rootViewController else { return }
        guard let blockView = rootViewController.view.viewWithTag(123) else { return }

        blockView.removeFromSuperview()
    }

    private func createBlurInView() {
        guard let rootViewController = window?.rootViewController else { return }

        let blurEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .dark))
        blurEffectView.frame = UIScreen.main.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleWidth]
        blurEffectView.tag = 456

        rootViewController.view.addSubview(blurEffectView)
    }

    private func removerBlurInView() {
        guard let rootViewController = window?.rootViewController else { return }
        guard let blurView = rootViewController.view.viewWithTag(456) else { return }

        blurView.removeFromSuperview()
    }
}

