//
//  APIManager.swift
//  MVVMClean
//
//  Created by Mac mini on 15/07/2024.
//

import Foundation

enum Method: String {
    case GET = "GET"
    case POST = "POST"
    case PUT = "PUT"
    case DELETE = "DELETE"
}

enum APIError: Error {
    case invalidURL
    case requestFailed
    case decodingError(Error)
    case invalidData
}

class APIManager {
    
    static let shared = APIManager()
    
    private init() {}
    
    func request(url: URL, method: Method, parameters: String? = nil, completion: @escaping (Result<String, APIError>) -> Void) {
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        
    
        if let parameters = parameters {
            request.httpBody = parameters.data(using: .utf8)
        }
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data, error == nil else {
                if error != nil {
                    completion(.failure(.requestFailed))
                } else {
                    completion(.failure(.invalidData))
                }
                return
            }
            
            if let responseString = String(data: data, encoding: .utf8) {
                completion(.success(responseString))
            } else {
                completion(.failure(.invalidData))
            }
        }.resume()
    }
    
}
