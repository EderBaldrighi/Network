//
//  NetworkTypealias.swift
//  NetworkExample
//
//  Created by Eder Baldrighi on 01/12/2020.
//  Copyright © 2020 Mobster. All rights reserved.
//

import Foundation

internal typealias Success = (_ data: Data) -> ()
internal typealias Failure = (_ error: Error) -> ()
internal typealias HttpHeaders = [String: String]
internal typealias UrlParameters = [String: String]
internal typealias BodyParameters = [String: Any]
