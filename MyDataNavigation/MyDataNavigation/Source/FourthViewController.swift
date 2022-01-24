//
//  FourthViewController.swift
//  MyDataNavigation
//
//  Created by cice on 20/01/2022.
//

import UIKit
import MessageUI

class FourthViewController: UIViewController {

    // MARK: - Variables
    var datosUsuario = DatosUsuraioModel()
    
    // MARK: - IBOutlets
    @IBOutlet weak var miNombreLBL : UILabel!
    @IBOutlet weak var miApellidoLBL : UILabel!
    @IBOutlet weak var miTelefonoLBL : UILabel!
    @IBOutlet weak var miDireccionLBL : UILabel!
    @IBOutlet weak var edadPerroLBL : UILabel!
    @IBOutlet weak var miCodigoPostalLBL : UILabel!
    @IBOutlet weak var miCiudadLBL : UILabel!
    @IBOutlet weak var miPosicionLBL : UILabel!
    
    
    @IBAction func enviarTodaLaInfoMailACTION(_ sender: Any) {
        
        if MFMailComposeViewController.canSendMail() {
            self.present(Utils.shared.configurationMailCompose(deledate : self,
                                                               recipients: ["info@mail.com", "masinfo@mail.es"],
                                                               emailBody: "Los datos del formulario de registro son \(String(describing: self.datosUsuario.nombreData)) \n \(String(describing: self.datosUsuario.apellidoData))"),
                         animated: true,
                         completion: nil)
        } else {
            self.present(Utils.shared.showAlertVC(title: "Que pasa!!",
                                                  message: "Estas en un Simulador y no puedes enviar emailº"),
                         animated: true,
                         completion: nil)
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configurationUI()
        // Do any additional setup after loading the view.
    }
    

    private func configurationUI() {
        self.miNombreLBL.text = "Mi Nombre es : \(self.datosUsuario.nombreData ?? "")"
        self.miApellidoLBL.text = "Mi Apellido es : \(self.datosUsuario.apellidoData ?? "")"
        self.miTelefonoLBL.text = "Mi Teléfono es : \(self.datosUsuario.telefonoData ?? "")"
        self.miDireccionLBL.text = "Mi Dirección es : \(self.datosUsuario.direccionData ?? "")"
        self.edadPerroLBL.text = "La Edad de mi Perro es : \(self.datosUsuario.edadPerroData ?? "")"
        self.miCodigoPostalLBL.text = "Mi Codigo Postal es : \(self.datosUsuario.codigoPostalData ?? "")"
        self.miCiudadLBL.text = "Mi Ciudad es : \(self.datosUsuario.ciudadData ?? "")"
        self.miPosicionLBL.text = "Mi Posicion Geografica es : \(self.datosUsuario.posicionGeograficaData ?? "")"
    }
    
    /*private func configurationMailCompose() -> MFMailComposeViewController {
        
        let mailCompose = MFMailComposeViewController()
        mailCompose.mailComposeDelegate = self
        mailCompose.setToRecipients(["info@mail.com", "masinfo@mail.es"])
        mailCompose.setSubject("Este es en mensaje para el equipo de soporte")
        
        let emailBody = "Los datos del formulario de registro son \(self.datosUsuario.nombreData) \n \(self.datosUsuario.apellidoData)"
        mailCompose.setMessageBody(emailBody, isHTML: false)
        return mailCompose
        
    }*/

}

extension FourthViewController : MFMailComposeViewControllerDelegate {
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
    
}
