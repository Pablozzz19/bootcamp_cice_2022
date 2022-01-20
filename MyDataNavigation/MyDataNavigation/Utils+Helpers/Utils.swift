//
//  Utils.swift
//  MyDataNavigation
//
//  Created by cice on 20/01/2022.
//

import Foundation
import UIKit

class Utils {
    
    static let shared = Utils()
    
    
    /// Method showAlertVC return an Alert generic component
    /// - Parameters:
    ///   - title: title put from VC to Alert generic component
    ///   - message: message put from VC to Alert generic component
    /// - Returns: return UIAlertController component
    func showAlertVC(title : String,
                     message : String) -> UIAlertController {
        
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        return alertVC
    }
    
}

struct DatosUsuraioModel {
    
    var nombreData : String?
    var apellidoData : String?
    var telefonoData : String?
    var direccionData : String?
    var edadPerroData : String?
    var codigoPostalData : String?
    var ciudadData : String?
    var posicionGeograficaData : String?
    
}
