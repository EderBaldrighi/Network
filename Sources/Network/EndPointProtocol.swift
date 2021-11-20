//
//  EndPointProtocol.swift
//  NetworkExample
//
//  Created by Eder Baldrighi on 01/12/2020.
//  Copyright © 2020 Mobster. All rights reserved.
//

import Foundation

/// EndPoint protocol
internal protocol EndPointProtocol {
    /// HTTP method from request
    var httpMethod: HttpMethod { get }
    /// Base url from request
    var baseUrl: URL { get }
    /// Complete path from request
    var path: String { get }
    /// Optional headers from request
    var headers: HttpHeaders? { get }
    /// Optional url parameters
    var urlParameters: UrlParameters? { get }
    /// Optional body paramenters
    var bodyParameters: BodyParameters? { get }
}
