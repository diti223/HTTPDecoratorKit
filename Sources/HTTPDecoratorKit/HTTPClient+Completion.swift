//
//  File.swift
//  
//
//  Created by Adrian Bilescu on 12.02.2023.
//

import Foundation

extension HTTPClient {
    func data(_ endpoint: String, method: HTTPMethod, headers: [String: String]?, body: Data?, completion: @escaping (Result<HTTPResponse, Error>) -> Void) {
        Task {
            do {
                let response = try await request(endpoint, method: method, headers: headers, body: body)
                completion(.success(response))
            } catch {
                completion(.failure(error))
            }
        }
    }
}
