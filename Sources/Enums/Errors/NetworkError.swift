//
//  NetworkError.swift
//  Network
//
//  Created by Eder Baldrighi on 01/12/2020.
//  Copyright © 2020 Mobster. All rights reserved.
//

import Foundation

/// Network enum error
public enum NetworkError : String, Error {
    case invalidBodyRequest = "Invalid body request."
    case parseFailed = "Parase failed."
    case requestFailed = "request failed"
}
