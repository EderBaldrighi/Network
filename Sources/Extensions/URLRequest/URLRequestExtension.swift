//
//  URLRequest.swift
//  Network
//
//  Created by Eder Baldrighi on 01/12/2020.
//  Copyright © 2020 Mobster. All rights reserved.
//

import Foundation

/// URLRequest extension - Custom methods to build and configure request.
internal extension URLRequest {
    // MARK: - Mutating functions
    /// Function responsible to configure request headers
    /// - Parameter headers: request headers
    mutating func configureHeaders(_ headers: HttpHeaders?) {
        guard let headers = headers else { return }
        for (key, value) in headers {
            self.setValue(value, forHTTPHeaderField: key)
        }
    }
    /// Function responsible to configure body request parameters
    /// - Parameter parameters: body request parameters
    /// - Throws: body request serialization error
    mutating func configureBody(_ parameters: BodyParameters?) throws {
        guard let parameters = parameters else { return }
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
            self.httpBody = jsonData
            self.validateBodyContetType()
        } catch {
            throw NetworkError.invalidBodyRequest
        }
    }
    /// Function responsible to configure request url parameters
    /// - Parameter parameters: url parameters
    mutating func configureUrl(_ parameters: UrlParameters?) {
        guard let url = self.url else { return }
        guard let parameters = parameters, !parameters.isEmpty else { return }
        guard var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false) else { return }
        urlComponents.queryItems = [URLQueryItem]()
        for (key, value) in parameters {
            let queryItem = URLQueryItem(name: key, value: "\(value)".addingPercentEncoding(withAllowedCharacters: .urlHostAllowed))
            urlComponents.queryItems?.append(queryItem)
        }
        self.url = urlComponents.url
        self.validateUrlContentType()
    }
    // MARK: - Private functions
    /// Validate content type header from body request parameters. Default value is application/json
    private mutating func validateBodyContetType() {
        if self.value(forHTTPHeaderField: "Content-Type") == nil {
            self.setValue("application/json", forHTTPHeaderField: "Content-Type")
        }
    }
    /// Validate content type header from request url. Default value is application/x-www-form-urlencoded; charset=utf-8
    private mutating func validateUrlContentType() {
        if self.value(forHTTPHeaderField: "Content-Type") == nil {
            self.setValue("application/x-www-form-urlencoded; charset=utf-8", forHTTPHeaderField: "Content-Type")
        }
    }
}
