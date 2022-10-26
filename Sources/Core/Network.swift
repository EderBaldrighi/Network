//
//  Network.swift
//  Network
//
//  Created by Eder Baldrighi on 01/12/2020.
//  Copyright © 2020 Mobster. All rights reserved.
//

import Foundation

/// Class responsbile to build, configure, cancel and make request
public class Network<EndPoint: EndPointProtocol>: NetworkProtocol {
    // MARK: - Variables
    private var task: URLSessionTask?
    // MARK: - Initializer
    public init() { }
    // MARK: - Public functions
    /// Function resposible to make the request
    /// - Parameters:
    ///   - T: Codable response type
    ///   - endPoint: endPoint protocol
    ///   - success: success block
    ///   - failure: failure block
    public func request(_ endPoint: EndPoint, success: @escaping Success, failure: @escaping Failure) {
        self.task = URLSession.shared.dataTask(with: endPoint.request, completionHandler: { (data, response, error) in
            NetworkLogger.shared.log(request: endPoint.request, response: response, data: data)
            guard let data = data else {
                failure(error ?? NetworkError.requestFailed)
                return
            }
            success(data)
        })
        self.task?.resume()
    }
    /// Function responsible to cancel current task
    public func cancel() {
        guard let task = self.task else { return }
        task.cancel()
    }
}
