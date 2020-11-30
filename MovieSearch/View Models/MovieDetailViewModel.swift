//
//  MovieDetailViewModel.swift
//  MovieSearch
//
//  Created by Aaron Lee on 2020-11-30.
//

import Foundation

final class MovieDetailViewModel: ObservableObject {
    
    private var movieDetail: MovieDetail?
    @Published var loadingState: LoadingState = .loading
    
    private var httpClient = HTTPClient()
    
    init(movieDetail: MovieDetail? = nil) {
        self.movieDetail = movieDetail
    }
    
    func getDetailsByImdbId(id: String) {
        
        httpClient.getMovieDetail(id: id) { result in
            switch result {
            case .success(let detail):
                DispatchQueue.main.async {
                    self.movieDetail = detail
                    self.loadingState = .success
                }
            case .failure(let error):
                print("Handle the error: \(error.localizedDescription)")
                DispatchQueue.main.async {
                    self.loadingState = .failed
                }
            }
        }
        
    }
    
    var title: String {
        self.movieDetail?.title ?? ""
    }
    
    var poster: String {
        self.movieDetail?.poster ?? ""
    }
    
    var plot: String {
        self.movieDetail?.plot ?? ""
    }
    
    var rating: Int {
        get {
            let ratingAsDouble = Double(self.movieDetail?.imdbRating ?? "0.0")
            return Int(ceil(ratingAsDouble ?? 0.0))
        }
    }
    
    var director: String {
        self.movieDetail?.director ?? ""
    }
    
}
