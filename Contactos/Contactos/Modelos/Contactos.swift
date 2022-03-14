//
//  Contactos.swift
//  Contactos
//
//  Created by cice on 10/03/2022.
//

import Foundation
import CoreData

final class Contactos: NSManagedObject, Identifiable {
    
    @NSManaged public var apellido: String
    @NSManaged public var direccion: String
    @NSManaged public var edad: String
    @NSManaged public var email: String
    @NSManaged public var genero: String
    @NSManaged public var iniciales: String
    @NSManaged public var nomrbe: String
    @NSManaged public var telefono: String
    
}

// Queries first option
extension Contactos {
    
    static func mostrarContactos() -> NSFetchRequest<Contactos> {
        
        // SQL select * from Contactos
        let request: NSFetchRequest<Contactos> = Contacto.fetchRequest() as! NSFetchRequest<Contactos>
        // SQL order by nombre asc
        request.sortDescriptors = [NSSortDescriptor(key: "nombre", ascending: true)]
        return request
        
    }
    
}
