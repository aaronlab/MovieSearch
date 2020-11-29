//
//  HTTPClient.swift
//  MovieSearch
//
//  Created by Aaron Lee on 2020-11-29.
//

import Foundation

enum NetworkError: Error {
    case badURL
    case noData
    case decodingError
}

final class HTTPClient {
    
    func getMoviesBy(search: String, completion: @escaping (Result<[Movie]?, NetworkError>) -> Void) {
        
        guard let url = URL(string: "http://www.omdbapi.com/?s=\(search)&apikey=\(APIKey.key)") else {
            return completion(.failure(.badURL))
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data, error == nil else {
                return completion(.failure(.noData))
            }
            
            guard let moviesResponse = try? JSONDecoder().decode(MovieResponse.self, from: data) else {
                return completion(.failure(.decodingError))
            }
            
            completion(.success(moviesResponse.movies))
            
        }.resume()
        
    }
    
}
