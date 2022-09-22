//
//  File.swift
//  
//
//  Created by Eder Baldrighi on 22/09/22.
//

import Foundation

extension Encodable {
    /// Converts encodable structure to dictionary.
    var bodyDictionary: BodyParameters? {
        guard let data = try? JSONEncoder().encode(self) else { return nil }
        return (try? JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)).flatMap { $0 as? [String: Any] }
    }
    /// Converts encodable structure to string dictionary.
    var urlDictionary: UrlParameters? {
        guard let data = try? JSONEncoder().encode(self) else { return nil }
        return (try? JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)).flatMap { $0 as? [String: String] }
    }
}
