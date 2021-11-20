//
//  Network.swift
//  NetworkExample
//
//  Created by Eder Baldrighi on 01/12/2020.
//  Copyright © 2020 GO.K. All rights reserved.
//

import Foundation

/// Class responsbile to build, configure, cancel and make request
internal class Network<EndPoint: EndPointProtocol>: NetworkProtocol {
    // MARK: - Variables
    private var task: URLSessionTask?
    // MARK: - Public functions
    /// Function resposible to make the request
    /// - Parameters:
    ///   - T: Codable response type
    ///   - endPoint: endPoint protocol
    ///   - success: success block
    ///   - failure: failure block
    func request(_ endPoint: EndPoint, success: @escaping Success, failure: @escaping Failure) {
        let session = URLSession.shared
        do {
            let request = try self.configRequest(from: endPoint)
            self.task = session.dataTask(with: request, completionHandler: { (data, response, error) in
                NetworkLogger.shared.log(request: request, response: response, data: data)
                guard let data = data else {
                    failure(error ?? NetworkError.requestFailed)
                    return
                }
                success(data)
            })
        } catch {
            failure(error)
        }
        self.task?.resume()
    }
    /// Function responsible to cancel current task
    func cancel() {
        guard let task = self.task else { return }
        task.cancel()
    }
    // MARK: - File private functions
    /// Function responbile to build and configure request
    /// - Parameter endPoint: endpoint protocol
    /// - Throws: error
    /// - Returns: URLRequest
    fileprivate func configRequest(from endPoint: EndPointProtocol) throws -> URLRequest {
        do {
            let url = endPoint.baseUrl.appendingPathComponent(endPoint.path)
            var request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalAndRemoteCacheData, timeoutInterval: 30.0)
            request.httpMethod = endPoint.httpMethod.rawValue
            request.configureHeaders(endPoint.headers)
            request.configureUrl(endPoint.urlParameters)
            try request.configureBody(endPoint.bodyParameters)
            return request
        } catch {
            throw error
        }
    }
}
