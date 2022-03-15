//
//  MenuViewModel.swift
//  SlideMenuApp
//
//  Created by cice on 15/03/2022.
//

import Foundation

enum MenuOptions: String {
    case currentView
    case logout
    case settings
    case alerts
    case reports
}

class MenuViewModel: ObservableObject {
    var topItems: [MenuItemViewModel] = [
        MenuItemViewModel(identifier: MenuOptions.currentView.rawValue,
                      icon: "book_sales",
                      title: "En progreso",
                      childs: []),
        MenuItemViewModel(identifier: MenuOptions.settings.rawValue,
                      icon: "budget",
                      title: "Settings",
                      childs: []),
        MenuItemViewModel(identifier: MenuOptions.reports.rawValue,
                      icon: "history",
                      title: "Reports",
                      childs: [])
    ]
    
    var bottomItems: [MenuItemViewModel] = [
        MenuItemViewModel(identifier: MenuOptions.logout.rawValue,
                      title: "Logout"),
        MenuItemViewModel(identifier: MenuOptions.alerts.rawValue,
                      title: "Alerts")
    ]
}
