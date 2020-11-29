//
//  FailedView.swift
//  MovieSearch
//
//  Created by Aaron Lee on 2020-11-29.
//

import SwiftUI

struct FailedView: View {
    var body: some View {
        Image("oops")
            .resizable()
            .scaledToFit()
    }
}

struct FailedView_Previews: PreviewProvider {
    static var previews: some View {
        FailedView()
    }
}
