//
//  File.swift
//  
//
//  Created by Eder Baldrighi on 22/09/22.
//

import Foundation

internal extension Encodable {
    /// Converts encodable structure to dictionary.
    var data: Data? {
        return try? JSONEncoder().encode(self)
    }
    /// Converts encodable structure to string dictionary.
    var dictionary: [String: Any]? {
        guard let data = try? JSONEncoder().encode(self) else { return nil }
        return (try? JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)).flatMap { $0 as? [String: Any] }
    }
}
