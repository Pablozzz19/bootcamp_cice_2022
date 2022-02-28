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
        List {
            Group {
                if !self.viewModel.dataSourceNowPlaying.isEmpty {
                    
                }
            }
        }
        .navigationTitle(Text("Movies"))
        .onAppear() {
            self.viewModel.fetchData()
        }
    }
}

struct MoviesView_Previews: PreviewProvider {
    static var previews: some View {
        MoviesView()
    }
}
