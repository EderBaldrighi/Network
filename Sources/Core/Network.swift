//
//  Network.swift
//  Network
//
//  Created by Eder Baldrighi on 01/12/2020.
//  Copyright © 2020 Mobster. All rights reserved.
//

import Foundation

/// Class responsbile to make and cancel request
class Network {
    // MARK: - Variables
    private var task: URLSessionTask?
    // MARK: - Functions
    /// Function responsible to make request
    /// - Parameters:
    ///   - T: Codable response type
    ///   - endPoint: EndPoint protocol
    ///   - success: Success trailing closures
    ///   - failure: Failure trailing closures
    func request<T: Codable>(endPoint: EndPoint, success: ((T) -> Void)? = nil, failure: ((Error) -> Void)? = nil) {
        self.task = URLSession.shared.dataTask(with: endPoint.request) { data, response, error in
            NetworkLogger.shared.log(request: endPoint.request, response: response, data: data)
            guard let data = data, let object = try? JSONDecoder().decode(T.self, from: data) else {
                failure?(error ?? NetworkError.parseFailed)
                return
            }
            success?(object)
        }
        self.task?.resume()
    }
    /// Function responsible to cancel request
    func cancel() {
        task?.cancel()
    }
}
