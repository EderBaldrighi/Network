//
//  NetworkError.swift
//  NetworkExample
//
//  Created by Eder Baldrighi on 01/12/2020.
//  Copyright © 2020 GO.K. All rights reserved.
//

import Foundation

/// Network enum error
internal enum NetworkError : String, Error {
    case invalidBodyRequest = "Invalid body request."
    case parseFailed = "Parase failed."
    case requestFailed = "request failed"
}
