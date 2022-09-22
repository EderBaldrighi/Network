//
//  NetworkLogger.swift
//  Network
//
//  Created by Eder Baldrighi on 11/12/20.
//  Copyright © 2020 Mobster. All rights reserved.
//

import Foundation

internal class NetworkLogger {
    
    static let shared = NetworkLogger()
    
    internal func log(request: URLRequest, response: URLResponse?, data: Data?) {
        var requestOutput: String = "\n\n- - - - - - - - - - REQUEST OUTPUT - - - - - - - - - -\n"
        requestOutput += self.getStatus(response: response as? HTTPURLResponse)
        requestOutput += self.getHttpMethodAndUrl(request: request)
        requestOutput += self.getHeaders(httpHeaders: request.allHTTPHeaderFields)
        requestOutput += self.getBodyRequest(body: request.httpBody)
        requestOutput += self.getBodyResponse(response: data)
        requestOutput += "\n- - - - - - - - - - - - - END - - - - - - - - - - - - -\n\n"
        print(requestOutput)
    }
    
    internal func getStatus(response: HTTPURLResponse?) -> String {
        guard let httpUrlResponse = response else { return "INVALID STATUS\n" }
        return "\nSTATUS\n\(httpUrlResponse.statusCode)\n"
    }
    
    internal func getHttpMethodAndUrl(request: URLRequest) -> String {
        guard let httpMethod = request.httpMethod, let url = request.url?.absoluteString else { return "METHOD OR URL NOT IMPLEMENTED\n" }
        return "\n\(httpMethod) \(url)"
    }
    
    internal func getHeaders(httpHeaders: [String : String]?) -> String {
        guard let headers = httpHeaders else { return "HEADER NOT IMPLEMENTED\n" }
        var requestOutput = "\n\nHEADERS\n"
        for (key, value) in headers {
            requestOutput += "\(key): \(value)\n"
        }
        requestOutput += "\n"
        return requestOutput
    }
    
    internal func getBodyRequest(body: Data?) -> String {
        guard let data = body,
              let json = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers),
              let jsonData = try? JSONSerialization.data(withJSONObject: json, options: .prettyPrinted) else { return "BODY REQUEST NOT IMPLEMENTED\n" }
        return "\nBODY\n\(String(decoding: jsonData, as: UTF8.self))\n"
    }
    
    internal func getBodyResponse(response: Data?) -> String {
        guard let data = response,
              let json = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers),
              let jsonData = try? JSONSerialization.data(withJSONObject: json, options: .prettyPrinted) else { return "BODY RESPONSE NOT EXISTS" }
        return "\nRESPONSE\n\(String(decoding: jsonData, as: UTF8.self))\n"
    }
}
