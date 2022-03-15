//
//  ContentView.swift
//  SlideMenuApp
//
//  Created by cice on 15/03/2022.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = MenuViewModel()
    @State private var showMenu = false
    @State private var showObservations = false
    
    var navigation: some View {
        NavigationBarView(title: "Navegacion Principal",
                          subtitle: "Subtitulo de la navegacion principal",
                          leftOptions: [NavigationBarItem.menuItem()],
                          rightOptions: [NavigationBarItem.observationsItem()]) { optionSelected in
            switch optionSelected {
            case NavigationBarItemType.menu:
                self.showMenu.toggle()
            case NavigationBarItemType.observations:
                self.showObservations.toggle()
            default:
                break
            }
        }
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0.0, content: {
            ZStack {
                navigation
                
                // MARK: Slide Menu
                if self.showMenu {
                    MenuView(items: self.viewModel.topItems,
                             bottomItems: self.viewModel.bottomItems,
                             optionSelected: { (text) in
                                //
                             },
                             hideMenu: {
                                //
                             },
                             selectedMenuItem: 0)
                }
            }
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
