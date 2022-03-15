//
//  NavigationBarView.swift
//  SlideMenuApp
//
//  Created by cice on 15/03/2022.
//

import SwiftUI

typealias NavigationBarType = Int

struct NavigationBarItemType {
    static let none: NavigationBarType = 0
    static let back: NavigationBarType = 1
    static let menu: NavigationBarType = 2
    static let observations: NavigationBarType = 3
}

struct NavigationBarItem: Identifiable {
    let id = UUID()
    let iconName: String?
    let type: NavigationBarType
    let text: String?
    let view: AnyView?
    
    init(iconName: String? = nil,
         type: NavigationBarType =  NavigationBarItemType.none,
         text: String? = nil) {
        self.iconName = iconName
        self.type = type
        self.text = text
        self.view = nil
    }
    
    init(type: NavigationBarType = NavigationBarItemType.none,
         view: AnyView? = nil) {
        self.type = type
        self.view = view
        self.iconName = nil
        self.text = nil
    }
}

extension NavigationBarItem {
    
    static func backItem() -> NavigationBarItem {
        NavigationBarItem(iconName: "arrow_back",
                          type: NavigationBarItemType.back,
                          text: "Back")
    }
    
    static func menuItem() -> NavigationBarItem {
        NavigationBarItem(iconName: "menu",
                          type: NavigationBarItemType.menu,
                          text: "Menuß")
    }
    
    static func observationsItem() -> NavigationBarItem {
        NavigationBarItem(iconName: "speech_bubble",
                          type: NavigationBarItemType.observations,
                          text: "Observations")
    }
}

struct NavigationBarView: View {
    
    var title: String
    var subtitle: String
    var leftOptions: [NavigationBarItem] = []
    var rightOptions: [NavigationBarItem] = []
    var optionSelected: ((NavigationBarType) -> Void)?
    
    var backgroundColor: Color
    var foregroundColor: Color
    
    init(title: String,
         subtitle: String,
         leftOptions: [NavigationBarItem] = [],
         rightOptions: [NavigationBarItem] = [],
         backgroundColor: Color = Color.black,
         foregroundColor: Color = Color.pink,
         optionSelected: ((NavigationBarType) -> Void)?) {
        self.title = title
        self.subtitle = subtitle
        self.leftOptions = leftOptions
        self.rightOptions = rightOptions
        self.backgroundColor = backgroundColor
        self.foregroundColor = foregroundColor
        self.optionSelected = optionSelected
    }
    
    var topSafe: CGFloat {
        (UIApplication.shared.windows.filter {
            $0.isKeyWindow
        }.first?.safeAreaInsets.top ?? 0.0)
    }
    
    var body: some View {
        GeometryReader { geo in
            ZStack(alignment: .bottomLeading) {
                VStack(alignment: .center, spacing: 0) {
                    ZStack {
                        HStack {
                            Spacer()
                            centerSection
                            Spacer()
                        }
                        
                        HStack {
                            ForEach(self.leftOptions) { item in
                                NavigationBarItemView(item: item) { optionSelected in
                                    self.optionSelected?(optionSelected)
                                }
                            }
                            Spacer()
                        }
                        
                        HStack {
                            Spacer()
                            ForEach(self.rightOptions) { item in
                                NavigationBarItemView(item: item) { optionSelected in
                                    self.optionSelected?(optionSelected)
                                }
                            }
                        }
                    }
                }
                //.frame(height: geo.size.height - topSafe)
                .frame(height: 90)
                .background(self.backgroundColor)
                .padding(.top, topSafe)
            }
            //.frame(height: 90)
        }
        //.background(self.backgroundColor)
        .edgesIgnoringSafeArea(.all)
    }
    
    var centerSection: some View {
        VStack {
            Text(self.title)
                .font(.system(size: 16))
                .foregroundColor(.white)
            Text(self.subtitle)
                .font(.system(size: 11))
                .foregroundColor(.gray)
        }
    }
    
}

struct NavigationBarItemView: View {
    
    let item: NavigationBarItem
    let optionSelected: ((NavigationBarType) -> Void)?
    
    init(item: NavigationBarItem,
         optionSelected: ((NavigationBarType) -> Void)?) {
        self.item = item
        self.optionSelected = optionSelected
    }
    
    var body: some View {
        if let view = item.view {
            view
        } else {
            Button {
                self.optionSelected?(item.type)
            } label: {
                Image(item.iconName ?? "")
                    .frame(width: 44, height: 44)
                    .padding(5)
            }
        }
    }
}

struct NavigationBarView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBarView(title: "Navigation Bar",
                          subtitle: "Subtitle Navigation Bar",
                          optionSelected: nil)
    }
}
