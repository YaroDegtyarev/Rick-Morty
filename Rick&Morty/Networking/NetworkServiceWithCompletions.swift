//
//  NetworkServiceWithCompletions.swift
//  Rick&Morty
//
//  Created by Ярослав Дегтярев on 18.11.2023.
//

import Foundation

class NetworkServiceWithCompletions {
    static let shared = NetworkServiceWithCompletions(); private init() { }
    
    private func createURL() -> URL? {
        let tunnel = "https://"
        let server = "rickandmortyapi.com"
        let endpoint = "/api/character"
        let getParams = ""
        let urlStr = tunnel + server + endpoint + getParams
        
        let url = URL(string: urlStr)
        return url
    }
    
    func fetchData(completion: @escaping (Result<PersonResults, Error>) -> ()) {
        guard let url = createURL() else {
            completion(.failure(NetworkingError.badUrl))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, URLResponse, error in
            guard let data else {
                if let error {
                    completion(.failure(error))
                }
                return
            }
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            do {
                let personsData = try decoder.decode(PersonResults.self, from: data)
                completion(.success(personsData))
            } catch {
                completion(.failure(NetworkingError.invalidData))
            }

           
        }
        .resume()
        
    }
  
    
    
}

enum NetworkingError: Error {
    case badUrl, badRequest, badResponse, invalidData
}
