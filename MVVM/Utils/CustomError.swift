//
//  CustomError.swift
//  MVVM
//
//  Created by Ильдар Аглиуллов on 18.02.2023.
//

import Foundation

enum CustomError {
    case noConnection, noData
}

extension CustomError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .noData: return "No data return"
        case .noConnection: return "No Internet connection"
        }
    }
}
