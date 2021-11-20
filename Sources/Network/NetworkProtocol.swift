//
//  NetworkProtocol.swift
//  NetworkExample
//
//  Created by Eder Baldrighi on 01/12/2020.
//  Copyright © 2020 GO.K. All rights reserved.
//

import Foundation

/// Network protocol
internal protocol NetworkProtocol: AnyObject {
    associatedtype EndPoint: EndPointProtocol
    /// Function resposible to make the request
    /// - Parameters:
    ///   - endPoint: end point protocol
    ///   - success: success block return Data content
    ///   - failure: failure block return Error object
    func request(_ endPoint: EndPoint, success: @escaping Success, failure: @escaping Failure)
    /// Function responsible to cancel current task
    func cancel()
}
