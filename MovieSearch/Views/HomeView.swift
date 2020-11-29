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
    @State private var movieName: String = ""
    
    // MARK: - INIT
    
    init() {
        self.viewModel = MovieListViewModel()
    }
    
    // MARK: - BODY

    var body: some View {
        VStack {
            TextField("Search", text: $movieName, onCommit:  {
                self.viewModel.searchByName(self.movieName)
            }) //: TEXT FIELD
            .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Spacer()
            
                .navigationBarTitle("Movies")
            
            if self.viewModel.loadingState == .success {
                MovieListView(movies: viewModel.movies)
            } else if self.viewModel.loadingState == .failed {
                FailedView()
            } else if self.viewModel.loadingState == .loading {
                LoadingView()
                Spacer()
            }
        } //: VSTACK
        .padding()
        .embedNavigationView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
