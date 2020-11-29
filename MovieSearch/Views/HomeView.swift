//
//  ContentView.swift
//  MovieSearch
//
//  Created by Aaron Lee on 2020-11-29.
//

import SwiftUI

struct HomeView: View {
    // MARK: - PROPERTIES
    
    @ObservedObject private var viewModel: MovieListViewModel
    
    
    // MARK: - INIT
    
    init() {
        self.viewModel = MovieListViewModel()
        self.viewModel.searchByName("batman")
    }
    
    // MARK: - BODY

    var body: some View {
        VStack {
            MovieListView(movies: viewModel.movies)
                .navigationBarTitle("Movies")
        }.embedNavigationView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
