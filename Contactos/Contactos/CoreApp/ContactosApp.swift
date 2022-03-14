//
//  ContactosApp.swift
//  Contactos
//
//  Created by cice on 10/03/2022.
//

import SwiftUI

@main
struct ContactosApp: App {
    
    let persistanceVM = PersistanceViewModel.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistanceVM.container.viewContext)
        }
    }
}
