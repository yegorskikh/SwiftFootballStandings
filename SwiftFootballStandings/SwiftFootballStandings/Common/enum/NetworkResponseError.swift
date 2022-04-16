//
//  NetworkResponseError.swift
//  SwiftFootballStandings
//
//  Created by Yegor Gorskikh on 15.04.2022.
//

import Foundation

enum NetworkResponseError: String, Error {
    case errorTimedOut = "Timed Out"
    case notConnectedToInternet = "ConnectedToInternet"
    case anotherError = "Another Error"
    case decodeError = "Decode Error"
    
    static func getNetworkResponseError(_ error: Error) -> NetworkResponseError {
        switch error._code {
        case NSURLErrorTimedOut:
            return .errorTimedOut
        case NSURLErrorNotConnectedToInternet:
            return .notConnectedToInternet
        default:
            return .anotherError
        }
    }
}
