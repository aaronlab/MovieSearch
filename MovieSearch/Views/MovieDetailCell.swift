//
//  MovieDetailCell.swift
//  MovieSearch
//
//  Created by Aaron Lee on 2020-11-30.
//

import SwiftUI

struct MovieDetailCell: View {
    
    let viewModel: MovieDetailViewModel
    
    var body: some View {
        ScrollView {
            
            VStack(alignment: .leading, spacing: 10) {
                
                URLImage(url: viewModel.poster)
                    .cornerRadius(10)
                
                Text(viewModel.title)
                    .font(.title)
                
                Text(viewModel.plot)
                
                Text("Director").fontWeight(.bold)
                
                Text(viewModel.director)
                
                HStack {
                    Rating(rating: .constant(viewModel.rating))
                    Text("\(viewModel.rating)/10")
                }.padding(.top, 10)
                
                Spacer()
                
            } //: VSTACK
            .padding()
            
            .navigationBarTitle(self.viewModel.title)
            
        } //: SCROLL
    }
}

//struct MovieDetailCell_Previews: PreviewProvider {
//    static var previews: some View {
//        MovieDetailCell()
//    }
//}
