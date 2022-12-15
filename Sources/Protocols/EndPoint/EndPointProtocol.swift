//
//  EndPointProtocol.swift
//  Network
//
//  Created by Eder Baldrighi on 01/12/2020.
//  Copyright © 2020 Mobster. All rights reserved.
//

import Foundation

/// EndPoint protocol
internal protocol EndPoint {
    var httpMethod: HttpMethod { get }
    var baseUrl: URL { get }
    var path: String { get }
    var headers: HttpHeaders? { get }
    var urlParameters: Codable? { get }
    var bodyParameters: Codable? { get }
}
