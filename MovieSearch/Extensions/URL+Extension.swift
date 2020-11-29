//
//  URL+Extension.swift
//  MovieSearch
//
//  Created by Aaron Lee on 2020-11-29.
//

import Foundation

extension URL {
    
    static func getMoviesByName(_ name: String) -> Self? {
        return URL(string: "https://www.omdbapi.com/?s=\(name)&apikey=\(APIKey.key)")
    }
    
    static func getMoviesById(_ id: String) -> Self? {
        return URL(string: "https://www.omdbapi.com/?i=\(id)&apikey=\(APIKey.key)")
    }
    
}
