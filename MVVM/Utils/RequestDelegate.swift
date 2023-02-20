//
//  RequestDelegate.swift
//  MVVM
//
//  Created by Ильдар Аглиуллов on 18.02.2023.
//

import Foundation

protocol RequestDelegate: AnyObject {
    func didUpdate(with state: ViewState)
}
