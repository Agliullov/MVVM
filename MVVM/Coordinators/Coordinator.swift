//
//  Coordinator.swift
//  MVVM
//
//  Created by Ильдар Аглиуллов on 20.02.2023.
//

import Foundation

public protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] { get set }
}

public extension Coordinator {
    
    func addChildCoordinator(_ childCoordinator: Coordinator) {
        self.childCoordinators.append(childCoordinator)
    }
    
    func removeChildCoordinator(_ childCoordinator: Coordinator) {
        self.childCoordinators = self.childCoordinators.filter { $0 !== childCoordinator }
    }
}
