//
//  RootViewCoordinator.swift
//  MVVM
//
//  Created by Ильдар Аглиуллов on 20.02.2023.
//

import Foundation
import UIKit

public typealias RootViewCoordinator = Coordinator & RootViewControllerProvider

public protocol RootViewControllerProvider: AnyObject {
    var rootViewController: UIViewController { get }
    func start()
}
