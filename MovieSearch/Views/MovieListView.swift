//
//  MovieList.swift
//  MovieSearch
//
//  Created by Aaron Lee on 2020-11-29.
//

import SwiftUI

struct MovieListView: View {
    // MARK: - PROPERTIES
    
    let movies: [MovieViewModel]
    
    // MARK: - BODY
    
    var body: some View {
        List(self.movies, id: \.imdbId) { movie in
            MovieCell(movie: movie)
        } //: LIST
        .listStyle(PlainListStyle())
    }
}

struct MovieCell: View {
    // MARK: - PROPERTIES
    
    let movie: MovieViewModel
    
    // MARK: - BODY
    
    var body: some View {
        HStack(alignment: .top) {
            URLImage(url: movie.poster)
                .frame(width: 100, height: 120)
                .cornerRadius(6)
            
            VStack(alignment: .leading) {
                Text(movie.title)
                    .font(.headline)
                
                Text(movie.year)
                    .opacity(0.5)
                    .padding(.top, 10)
            } //: VSTACK
            .padding(5)
            
            Spacer()
        } //: HSTACK
        .contentShape(Rectangle())
    }
    
}
