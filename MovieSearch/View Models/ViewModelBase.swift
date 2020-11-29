//
//  ViewModelBase.swift
//  MovieSearch
//
//  Created by Aaron Lee on 2020-11-29.
//

import Foundation

enum LoadingState {
    case loading, success, failed, none
}

class ViewModelBase: ObservableObject {
    
    @Published var loadingState: LoadingState = .none
    
}
