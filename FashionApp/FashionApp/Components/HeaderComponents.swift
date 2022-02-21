//
//  HeaderComponents.swift
//  FashionApp
//
//  Created by cice on 17/02/2022.
//

import SwiftUI

struct HeaderComponents: View {
    var body: some View {
        VStack {
            titleView(title: "Header Component")
            subtitleView(subtitle: "Estamos aprendiendo SwiftUI, con Xcode 12 y 13 para mejorar nuestra compresión del mundo Apple")
            descriptionView(description: "Estamos con la base de la gestión de subcomponentes que hace que SwiftUI sea super ligero de entender.")
        }
    }
}

struct titleView: View {
    var title: String
    var body: some View {
        Text(title)
            .padding(20)
            .background(Color.orange)
            .cornerRadius(20)
            .font(.largeTitle)
    }
}

struct subtitleView: View {
    var subtitle: String
    var body: some View {
        Text(subtitle)
            .padding(.horizontal, 20)
            .font(.title3)
            .foregroundColor(.black)
    }
}

struct descriptionView: View {
    var description: String
    var body: some View {
        Text(description)
            .padding([.horizontal, .top], 20)
            .background(Color.orange)
            .font(.callout)
            .foregroundColor(.black)
    }
}

struct HeaderComponents_Previews: PreviewProvider {
    static var previews: some View {
        HeaderComponents()
    }
}
