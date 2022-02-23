//
//  ContentView.swift
//  CiceTmdbApp
//
//  Created by cice on 22/02/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            MoviesCoordinator.navigation()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
