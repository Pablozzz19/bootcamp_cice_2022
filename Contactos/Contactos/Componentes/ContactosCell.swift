//
//  ContactosCell.swift
//  Contactos
//
//  Created by cice on 10/03/2022.
//

import SwiftUI

struct ContactosCell: View {
    
    var contactos: Contactos
    
    var body: some View {
        HStack {
            Text(contactos.iniciales)
                .padding(20)
                .background(Color.blue)
                .clipShape(Circle())
                .foregroundColor(.white)
                .font(.title)
            
            VStack(alignment: .leading) {
                Text(contactos.nomrbe)
                    .font(.title)
                    .bold()
                Text(contactos.apellido)
                    .font(.headline)
                Text(contactos.telefono)
                    .font(.caption)
                    .foregroundColor(.blue)
            }
        }
    }
}

struct ContactosCell_Previews: PreviewProvider {
    static var previews: some View {
        ContactosCell(contactos: Contacto())
    }
}
