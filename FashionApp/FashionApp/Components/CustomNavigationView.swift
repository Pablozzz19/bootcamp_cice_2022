//
//  CustomNavigationView.swift
//  FashionApp
//
//  Created by cice on 21/02/2022.
//

import SwiftUI

struct CustomNavigationView: View {
    
    @State private var showAlert = false
    @Binding var showAlertTres: Bool
    
    var body: some View {
        ZStack {
            Text("Seasons").font(.system(size: 20))
            
            HStack(spacing: 8) {
                // Alerta con Xcode 12
                Button {
                    self.showAlert.toggle()
                } label: {
                    Image(systemName: "slider.horizontal.3")
                }
                .alert(isPresented: self.$showAlert) {
                    Alert(title: Text("Hola soy una Alert em SwiftUI"),
                          message: Text("Aqui estamos aprendiendo como se hace una alerta en SwiftUI"),
                          primaryButton: .default(Text("OK"), action: {
                            // Aqui se hacen las acciones
                          }), secondaryButton: .cancel(Text("Cancel"), action: {
                            // Aqui se hacen las acciones
                          }))
                }
                
                Spacer()
                
                Button {
                    // Aqui se ejecuta la accion del boton
                } label: {
                    Image(systemName: "magnifyingglass")
                }
                
                Button {
                    // Aqui se ejecuta la accion del boton
                    self.showAlertTres.toggle()
                } label: {
                    Image(systemName: "alarm")
                }
            }
            .padding(.horizontal, 8)
            .font(.callout)
            //.foreground(.black)
        }
    }
}

struct CustomNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        CustomNavigationView(showAlertTres: .constant(false))
    }
}
