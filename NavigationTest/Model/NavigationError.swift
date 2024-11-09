//
//  NavigationError.swift
//  NavigationTest
//
//  Created by Ricardo Rodríguez on 9/11/24.
//

import Foundation

enum NavigationError: Error {
    case invalidSearch
    case unexpectedError(error: Error)
}

extension NavigationError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .invalidSearch:
            return NSLocalizedString("Too many characters in search query.", comment: "")
        case .unexpectedError(let error):
            return NSLocalizedString("Received unexpected error. \(error.localizedDescription)", comment: "")
        }
    }
}
