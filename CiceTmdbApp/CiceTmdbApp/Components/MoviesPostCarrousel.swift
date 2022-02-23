//
//  MoviesPostCarrousel.swift
//  CiceTmdbApp
//
//  Created by cice on 23/02/2022.
//

import SwiftUI

struct MoviesPostCarrousel: View {
    
    var title: String
    var moviesModel: [ResultNowPlaying]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            HStack {
                Text(title)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.horizontal)
                Rectangle()
                    .fill(Color.blue.opacity(0.3))
                    .frame(width: 50, height: 5)
            }
            .padding(.bottom, 20)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 20) {
                    ForEach(self.moviesModel) { movie in
                        MoviePosterCell(modelData: movie)
                    }
                }
            }
        }
    }
}

struct MoviePosterCell: View {
    
    private var modelData: ResultNowPlaying
    
    init(modelData: ResultNowPlaying) {
        self.modelData = modelData
    }
    
    var body: some View {
        Text(self.modelData.originalTitle ?? "")
    }
}

struct MoviesPostCarrousel_Previews: PreviewProvider {
    static var previews: some View {
        MoviesPostCarrousel(title: "Now Playing",
                            moviesModel: MoviesServerModel.stubbedMoviesNowPlaying)
    }
}
