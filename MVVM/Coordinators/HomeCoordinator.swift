//
//  HomeCoordinator.swift
//  MVVM
//
//  Created by Ильдар Аглиуллов on 20.02.2023.
//

import Foundation
import UIKit

class HomeCoordinator: RootViewCoordinator {
    
    var childCoordinators: [Coordinator] = []
    var rootViewController: UIViewController {
        return self.navigationController
    }
    
    private var navigationController: UINavigationController = {
        let viewModel = HomeViewModel()
        let viewController = HomeViewController(viewModel: viewModel)
        let navigationController = UINavigationController(rootViewController: viewController)
        return navigationController
    }()
    
    func start() {
        
    }
}
