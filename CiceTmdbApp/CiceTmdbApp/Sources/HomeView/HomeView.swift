//
//  HomeView.swift
//  CiceTmdbApp
//
//  Created by cice on 24/02/2022.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject private var viewModel = HomeViewModel()
    
    var body: some View {
        TabView(selection: self.$viewModel.selectedTabItem) {
            ForEach(self.viewModel.tabItemViewModels, id: \.self) { item in
                tabView(tabItemType: item.type)
                    .tabItem {
                        Image(systemName: item.imageName)
                        Text(item.title)
                    }.tag(item.type)
            }
        }
        .accentColor(.red)
        .environment(\.colorScheme, .dark)
    }
    
    @ViewBuilder
    func tabView(tabItemType: TabItemViewModel.TabItemType) -> some View {
        switch tabItemType {
        case .movies:
            MoviesCoordinator.navigation()
        case .shows:
            ShowsCoordinator.navigation()
        case .people:
            MoviesCoordinator.navigation()
        case .search:
            MoviesCoordinator.navigation()
        case .profile:
            MoviesCoordinator.navigation()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
