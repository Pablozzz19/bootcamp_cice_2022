//
//  CustomTextField.swift
//  CiceTmdbApp
//
//  Created by cice on 03/03/2022.
//

import SwiftUI

struct CustomTextField: View {
    
    var placeholder: String
    var title: String
    var text: Binding<String>
    
    var body: some View {
        HStack {
            Image(systemName: "person")
            ZStack(alignment: .leading) {
                Text(title)
                    .foregroundColor(.gray)
                    .offset(y: text.wrappedValue.isEmpty ? 0 : -25)
                    .scaleEffect(y: text.wrappedValue.isEmpty ? 1 : 0.8, anchor: .leading)
                TextField(placeholder, text: text)
                    .foregroundColor(.black)
            }
            .padding(.top, 15)
            .animation(.spring(response: 0.2,
                               dampingFraction: 0.5,
                               blendDuration: 0.3),
                       value: text.wrappedValue.isEmpty)
        }
    }
}

struct CustomSecuretextField: View {
    
    var placeholder: String
    var title: String
    var text: Binding<String>
    
    var body: some View {
        HStack {
            Image(systemName: "lock")
            ZStack(alignment: .leading) {
                Text(title)
                    .foregroundColor(.gray)
                    .offset(y: text.wrappedValue.isEmpty ? 0 : -25)
                    .scaleEffect(y: text.wrappedValue.isEmpty ? 1 : 0.8, anchor: .leading)
                SecureField(placeholder, text: text)
                    .foregroundColor(.black)
            }
            .padding(.top, 15)
            .animation(.spring(response: 0.2,
                               dampingFraction: 0.5,
                               blendDuration: 0.3),
                       value: text.wrappedValue.isEmpty)
        }
    }
}

struct CustomTextField_Previews: PreviewProvider {
    static var previews: some View {
        CustomTextField(placeholder: "email",
                        title: "email",
                        text: .constant("email@email.com"))
    }
}
