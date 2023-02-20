//
//  ViewState.swift
//  MVVM
//
//  Created by Ильдар Аглиуллов on 18.02.2023.
//

import Foundation

enum ViewState {
    case idle
    case loading
    case success
    case error(Error)
}
