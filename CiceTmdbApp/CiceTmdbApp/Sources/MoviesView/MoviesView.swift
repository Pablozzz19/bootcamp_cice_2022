//
//  MoviesView.swift
//  CiceTmdbApp
//
//  Created by cice on 23/02/2022.
//

import SwiftUI

struct MoviesView: View {
    
    @StateObject var viewModel = MoviesViewModel()
    
    var body: some View {
        List{
            Group{
                if !self.viewModel.dataSourceNowPlaying.isEmpty {
                    MoviesPostCarrousel(title: "Now Playing",
                                          moviesModel: self.viewModel.dataSourceNowPlaying,
                                          isPoster: false)
                }
            }
            
            Group{
                if !self.viewModel.dataSourcePopular.isEmpty {
                    MoviesPostCarrousel(title: "Popular",
                                          moviesModel: self.viewModel.dataSourcePopular,
                                          isPoster: true)
                }
            }
            
            Group{
                if !self.viewModel.dataSourceTopRate.isEmpty {
                    MoviesPostCarrousel(title: "Top Rate",
                                          moviesModel: self.viewModel.dataSourceTopRate,
                                          isPoster: false)
                }
            }
            
            Group{
                if !self.viewModel.dataSourceUpcoming.isEmpty {
                    MoviesPostCarrousel(title: "UpComing",
                                          moviesModel: self.viewModel.dataSourceUpcoming,
                                          isPoster: true)
                }
            }
        }
        .listStyle(PlainListStyle())
        .navigationTitle(Text("Movies"))
        .onAppear {
            self.viewModel.fetchData()
        }
    }
        
}

struct MoviesView_Previews: PreviewProvider {
    static var previews: some View {
        MoviesView()
    }
}
