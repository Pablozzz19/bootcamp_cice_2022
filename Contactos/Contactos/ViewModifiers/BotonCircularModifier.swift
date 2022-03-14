//
//  BotonCircularModifier.swift
//  Contactos
//
//  Created by cice on 10/03/2022.
//

import SwiftUI

struct BotonCircularModifier: ViewModifier {
    
    var fontFamily: String?
    var fontSize: CGFloat?
    var foregroundColor: Color?
    var background: Color?
    var padding: CGFloat?
    
    func body(content: Content) -> some View {
        content
            .padding(padding ?? 20)
            .background(background ?? Color.gray)
            .clipShape(Circle())
            .foregroundColor(foregroundColor ?? .white)
            .font(.custom(fontFamily ?? "Arial", size: fontSize ?? 10))
    }
}

struct BotonCircularModifier_Previews: PreviewProvider {
    static var previews: some View {
        Text("AO")
            .modifier(BotonCircularModifier())
    }
}
