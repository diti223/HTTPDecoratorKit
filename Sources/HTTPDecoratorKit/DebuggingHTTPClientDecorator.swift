//
//  File.swift
//  
//
//  Created by Adrian Bilescu on 13.02.2023.
//

import Foundation

public struct DebuggingHTTPClientDecorator: HTTPClient {
    let client: HTTPClient
    let output: (String) -> Void
    
    public init(client: HTTPClient, output: @escaping (String) -> Void) {
        self.client = client
        self.output = output
    }
    
    public func request(
        _ endpoint: String,
        method: HTTPMethod,
        headers: [String: String]?,
        body: Data?) async throws -> HTTPResponse {
            let request = HTTPRequest(endpoint: endpoint, method: method, headers: headers, body: body)
            outputRequest(request)
            do {
                let response = try await client.request(endpoint, method: method, headers: headers, body: body)
                outputResponse(response, request: request)
            } catch {
                outputError(error)
                throw error
            }
            return response
    }


    private func outputRequest(_ request: HTTPRequest) {
        output("Request: \(request)")
        output("Headers: \(request.headers ?? [:])")
        if let body = request.body {
            output("Body: \(body)")
        } else {
            output("Body: <empty>")
        }
    }

    private func outputResponse(_ response: HTTPResponse, request: HTTPRequest) {
        output("Response: \(request) \(response.statusCode)")
        output("Headers: \(response.headers ?? [:])")
        if let data = response.data {
            output("Body: \(data)")
        } else {
            output("Body: <empty>")
        }
    }

    private func outputError(_ error: Error) {
        output("Error: \(error)")
    }

}
