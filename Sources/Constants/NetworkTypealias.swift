//
//  NetworkTypealias.swift
//  Network
//
//  Created by Eder Baldrighi on 01/12/2020.
//  Copyright © 2020 Mobster. All rights reserved.
//

import Foundation

public typealias Success = (_ data: Data) -> ()
public typealias Failure = (_ error: Error) -> ()
public typealias HttpHeaders = [String: String]
public typealias UrlParameters = [String: Any]
public typealias BodyParameters = [String: Any]
