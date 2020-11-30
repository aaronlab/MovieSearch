//
//  MovieDetailView.swift
//  MovieSearch
//
//  Created by Aaron Lee on 2020-11-30.
//

import SwiftUI

struct MovieDetailView: View {
    
    let imdbId: String
    @ObservedObject private var viewModel = MovieDetailViewModel()
    
    var body: some View {
        VStack {
            if viewModel.loadingState == .loading {
                LoadingView()
            } else if viewModel.loadingState == .success {
                
            } else if viewModel.loadingState == .failed {
                FailedView()
            }
        }
        .onAppear {
            self.viewModel.getDetailsByImdbId(id: self.imdbId)
        }
    }
}

//struct MovieDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        MovieDetailView()
//    }
//}
