//
//  ContentView.swift
//  MovieSearch
//
//  Created by Aaron Lee on 2020-11-29.
//

import SwiftUI

struct MovieList: View {
    // MARK: - PROPERTIES
    
    // MARK: - BODY

    var body: some View {
        Text("Hello, world!")
            .padding()
            // TEST
            .onAppear {
                HTTPClient().getMoviesBy(search: "batman") { result in
                    switch result {
                    case .success(let movies):
                        print(movies)
                    case .failure(let error):
                        print(error)
                    }
                }
                
                HTTPClient().getMovieDetail(id: "tt2313197") { result in
                    switch result {
                    case .success(let movieDetail):
                        print(movieDetail)
                    case .failure(let error):
                        print(error)
                    }
                }
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MovieList()
    }
}
