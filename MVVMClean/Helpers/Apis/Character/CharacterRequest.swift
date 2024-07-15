//
//  CharacterRequest.swift
//  MVVMClean
//
//  Created by Mac mini on 15/07/2024.
//

import Foundation
protocol CharacterRequestInterface {
    func getListCharacters()
    
}

class CharacterRequest {
    final private let characterURL = App.baseURL + "/characters"
    func getListCharacters() {
        guard let url = URL(string: characterURL) else {
//            completion(.failure(.invalidURL))
            return
        }
        
        APIManager.shared.request(
                url: url,
                method: .GET,
                completion: { (result: Result<String, APIError>) in
                    switch result {
                    case .success(let response):
                        if let jsonData = response.data(using: .utf8) {
                            do {
                                _ = try JSONDecoder().decode(Characters.self, from: jsonData)
//                                completion(.success(characters))
                            } catch {
                                print("Error decoding JSON: \(error)")
                            }
                        }
                    case .failure(let error):
                        print(error)
//                        completion(.failure(error))
                        break
                    }
                }
            )
    }
}
