//
//  MovieListViewModel.swift
//  MovieSearch
//
//  Created by Aaron Lee on 2020-11-29.
//

import Foundation

final class MovieListViewModel: ViewModelBase {
    
    @Published var movies = [MovieViewModel]()
    let httpClient = HTTPClient()
    
    func searchByName(_ name: String) {
        
        if name.isEmpty {
            return
        }
        
        DispatchQueue.main.async {
            self.loadingState = .loading
        }
        
        httpClient.getMoviesBy(search: name.trimmedAndEscaped()) { (result) in
            switch result {
            case .success(let movies):
                if let movies = movies {
                    DispatchQueue.main.async {
                        self.movies = movies.map(MovieViewModel.init)
                        self.loadingState = .success
                    }
                }
            case .failure(let error):
                print("Handle Error: \(error)")
                DispatchQueue.main.async {
                    self.loadingState = .failed
                }
            }
        }
        
    }
    
}

struct MovieViewModel {
    
    let movie: Movie
    
    var imdbId: String {
        movie.imdbId
    }
    
    var title: String {
        movie.title
    }
    
    var poster: String {
        movie.poster
    }
    
    var year: String {
        movie.year
    }
    
}
