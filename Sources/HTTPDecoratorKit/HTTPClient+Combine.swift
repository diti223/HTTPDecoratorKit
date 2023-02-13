//
//  File.swift
//  
//
//  Created by Adrian Bilescu on 11.02.2023.
//

import Foundation
import Combine

public extension HTTPClient {
    func requestPublisher(endpoint: String, method: HTTPMethod, headers: [String: String]?, body: Data?) -> AnyPublisher<HTTPResponse, Error> {
        Future<HTTPResponse, Error> { promise in
            Task {
                do {
                    let response = try await self.request(endpoint, method: method, headers: headers, body: body)
                    promise(.success(response))
                } catch {
                    promise(.failure(error))
                }
            }
        }.eraseToAnyPublisher()
    }
}
