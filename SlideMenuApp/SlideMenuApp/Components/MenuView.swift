//
//  MenuView.swift
//  SlideMenuApp
//
//  Created by cice on 15/03/2022.
//

import SwiftUI

struct MenuItemViewModel: Identifiable {
    var id = UUID()
    var identifier: String = ""
    var icon: String = ""
    var title: String = ""
    var isExpanded: Bool = false
    var childs: [MenuItemViewModel] = []
    var isEnable: Bool = true
}

struct MenuView: View {
    
    var items: [MenuItemViewModel]
    var bottomItems: [MenuItemViewModel]
    var optionSelected: (String) -> Void
    var hideMenu: () -> Void
    

    @State var selectedMenuItem: Int? = nil
    @State private var isShow: Bool = false
    
    private var animationDuration: TimeInterval = 0.3
    private var widthPercent: CGFloat = 0.4
    private var horizontalPadding: CGFloat = 30.0
    
    init(items: [MenuItemViewModel],
         bottomItems: [MenuItemViewModel],
         optionSelected: @escaping (String) -> Void,
         hideMenu: @escaping () -> Void,
         selectedMenuItem: Int? = nil) {
        self.items = items
        self.bottomItems = bottomItems
        self.hideMenu = hideMenu
        _selectedMenuItem = State(initialValue: selectedMenuItem)
        
    }
    
    var body: some View {
        ZStack(alignment: .leading){
            background
            HStack {
                VStack(alignment: .leading) {
                    topBar
                        .padding(.horizontal, horizontalPadding)
                    topOptions
                    Spacer()
                    bottomOptions
                }
                .frame(width: UIScreen.main.bounds.width * widthPercent)
            }
            .background(Color.black)
            .edgesIgnoringSafeArea(.all)
            .offset(x: isShow ? 0 : -((UIScreen.main.bounds.width * widthPercent) + (horizontalPadding * 2)))
            .animation(.easeInOut(duration: animationDuration), value: true)
        }
    }
    
    var background: some View {
        Color.black.opacity(0.6)
            .edgesIgnoringSafeArea(.all)
            .opacity(isShow ? 1.0 : 0.0)
            .animation(.easeInOut(duration: animationDuration), value: isShow)
            .onTapGesture {
                self.hideMenuAsync()
            }
    }
    
    var bottomOptions: some View {
        VStack(spacing: 20) {
            ForEach(items.indices) { index in
                HStack {
                    let item = items[index]
                    //let isSelected = self.selectedMenuItem == index
                    Rectangle()
                        .frame(width: 2, height: 52)
                    MenuLavel1ItemView(item: item) { (optionSelected) in
                        self.selectedMenuItem = index
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                            self.optionSelectedAsync(option: optionSelected.identifier)
                        }
                    }
                    .padding(.horizontal)
                    .frame(height: 50)
                    .foregroundColor(.white)
                }
            }
        }
    }
    
    var topBar: some View {
        HStack {
            Image("Logo_slide_menu")
            Spacer()
            Button {
                self.hideMenuAsync()
            } label: {
                Image("arrow_back")
                    .foregroundColor(.white)
                    .padding()
            }
        }
    }
    
    var topOptions: some View {
        VStack(spacing: 10) {
            ForEach(items.indices) { index in
                HStack {
                    let item = items[index]
                    //let isSelected = self.selectedMenuItem == index
                    Rectangle()
                        .frame(width: 2, height: 52)
                    MenuLavel1ItemView(item: item) { (optionSelected) in
                        self.selectedMenuItem = index
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                            self.optionSelectedAsync(option: optionSelected.identifier)
                        }
                    }
                    .padding(.horizontal)
                    .frame(height: 50)
                    .foregroundColor(.white)
                }
            }
        }
    }
    
    private func hideMenuAsync() {
        self.isShow.toggle()
        DispatchQueue.main.asyncAfter(deadline: .now() + animationDuration) {
            self.hideMenu()
        }
    }
    
    private func optionSelectedAsync(option: String) {
        self.isShow.toggle()
        DispatchQueue.main.asyncAfter(deadline: .now() + animationDuration) {
            self.optionSelected(option)
        }
    }
}

struct MenuLavel1ItemView: View {
    @State var item: MenuItemViewModel
    var optionSelected: (MenuItemViewModel) -> Void
    
    var body: some View {
        VStack {
            Button {
                if self.item.childs.count > 0 {
                    withAnimation {
                        self.item.isExpanded.toggle()
                    }
                } else {
                    self.optionSelected(item)
                }
            } label: {
                HStack(spacing: 15) {
                    ZStack {
                        Image(item.icon)
                    }
                    
                    Text(item.title)
                    
                    Spacer()
                    
                    if item.childs.count > 0 {
                        Image(systemName: item.isExpanded ? "chevron.up" : "chevron.down")
                            .font(.caption)
                            .padding(.leading, 10)
                    } else {
                        Image(systemName: "chevron.right")
                            .font(.caption)
                            .padding(.leading, 10)
                    }
                }
            }
        }
    }
}

/*struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView(items: self,
                 bottomItems: <#T##[MenuItemViewModel]#>,
                 optionSelected: <#T##(String) -> Void#>,
                 hideMenu: <#T##() -> Void#>,
                 selectedMenuItem: <#T##Int?#>)
    }
}*/
