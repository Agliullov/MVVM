//
//  AppCoordinator.swift
//  MVVM
//
//  Created by Ильдар Аглиуллов on 20.02.2023.
//

import Foundation
import UIKit

class AppCoordinator: RootViewCoordinator {
    
    let window: UIWindow
    
    var childCoordinators: [Coordinator] = []
    
    private(set) var rootViewController: UIViewController = SplashController() {
        didSet {
            UIView.transition(with: window, duration: 0.3, options: .transitionCrossDissolve) {
                self.window.rootViewController = self.rootViewController
            }
        }
    }
    
    public init(window: UIWindow) {
        self.window = window
        self.window.backgroundColor = .systemBackground
        self.window.rootViewController = rootViewController
        self.window.makeKeyAndVisible()
    }
    
    private func setCurrentCoordinator(_ coordinator: RootViewCoordinator) {
        rootViewController = coordinator.rootViewController
    }
    
    func start() {
        let homeCoordinator = HomeCoordinator()
        addChildCoordinator(homeCoordinator)
        setCurrentCoordinator(homeCoordinator)
    }
}
