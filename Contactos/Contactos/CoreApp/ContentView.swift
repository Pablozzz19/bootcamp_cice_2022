//
//  ContentView.swift
//  Contactos
//
//  Created by cice on 10/03/2022.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(fetchRequest: Contactos.mostrarContactos()) var contactos: FetchedResults<Contactos>

    var body: some View {
        NavigationView {
            
            VStack {
                List {
                    ForEach(self.contactos) { item in
                        ContactosCell(contactos: item)
                    }.onDelete { index in
                        self.borrarRegistro(data: index)
                    }
                }
                
                NavigationLink(destination: AgregarContactoView()) {
                    HStack(spacing: 20) {
                        Image(systemName: "plus.app.fill")
                            .foregroundColor(.white)
                            .font(.title)
                        Text("Guardar Contacto")
                            .foregroundColor(.white)
                            .font(.title2)
                    }
                    .frame(width: UIScreen.main.bounds.width * 0.9, height: 50)
                    .background(Color.green)
                    .clipShape(Capsule())
                }
            }
            .navigationTitle("Contactos")
            
        }
    }
    
    private func borrarRegistro(data: IndexSet) {
        guard let indexUnw = data.first else { return }
        let borrarRegistro = self.contactos[indexUnw]
        self.viewContext.delete(borrarRegistro)
        do {
            try self.viewContext.save()
        } catch let error as NSError {
            print("Error al borrar registros", error.localizedDescription)
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
