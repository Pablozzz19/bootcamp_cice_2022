//
//  FashionView.swift
//  FashionApp
//
//  Created by cice on 21/02/2022.
//

import SwiftUI

struct FashionView: View {
    
    @State private var showCustomAlertView = false
    
    var body: some View {
        ZStack {
            VStack {
                CustomNavigationView(showAlertTres: self.$showCustomAlertView)
                CustomBodyMainView()
            }
            .blur(radius: self.showCustomAlertView ? 3 : 0)
            
            if showCustomAlertView {
                CustomAlertView(title: "Esta es una Custom Alert View",
                                message: "Esta es una alerta personalizada y se colocará encima de la vista principal y se añadirá un efecto de blur y el fondo medio opaco",
                                hideCustomAlertView: self.$showCustomAlertView)
            }
        }
    }
}

struct FashionView_Previews: PreviewProvider {
    static var previews: some View {
        FashionView()
    }
}
