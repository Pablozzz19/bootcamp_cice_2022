//
//  Utils.swift
//  MyDataNavigation
//
//  Created by cice on 20/01/2022.
//

import Foundation
import UIKit
import MessageUI

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
    
    
    /// Method configuracionPickerView
    /// - Parameters:
    ///   - tag: Int
    ///   - delegate: UIPickerViewDelegate
    ///   - dataSource: UIPickerViewDataSource
    ///   - textField: UITextField
    func configuracionPickerView(tag: Int,
                                 delegate: UIPickerViewDelegate,
                                 dataSource: UIPickerViewDataSource,
                                 textField: UITextField) {
        let pickerView = UIPickerView()
        pickerView.delegate = delegate
        pickerView.dataSource = dataSource
        pickerView.tag = tag
        textField.inputView = pickerView
        
    }
    
    /// Method dataIntextFieldIsEmpty
    /// - Parameters:
    ///   - param : [String]
    func dataIntextFieldIsEmpty(param : [String]) -> Bool {
        
        var semaforo : Bool = true
        for item in param {
            if (item.isEmpty) {
                semaforo = false
                break
            }
        }
        return semaforo
    }
    
    func configurationMailCompose(deledate : MFMailComposeViewControllerDelegate, recipients : [String], emailBody : String) -> MFMailComposeViewController {
        
        let mailCompose = MFMailComposeViewController()
        mailCompose.mailComposeDelegate = deledate
        mailCompose.setToRecipients(recipients)
        mailCompose.setSubject("Este es el mensaje para el equipo de soporte")
        
        mailCompose.setMessageBody(emailBody, isHTML: false)
        return mailCompose

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
