//
//  SecondViewController.swift
//  MyDataNavigation
//
//  Created by cice on 20/01/2022.
//

import UIKit

class SecondViewController: UIViewController {

    // MARK: - Variables
    var datosUsuario = DatosUsuraioModel()
    var edadPerro : Int?
    var nuevaEdadPerro : Int?
    
    // MARK: - IBOutlets
    @IBOutlet weak var miNombreLBL : UILabel!
    @IBOutlet weak var miApellidoLBL : UILabel!
    
    @IBOutlet weak var miTelefonoTF : UITextField!
    @IBOutlet weak var miDireccionTF : UITextField!
    @IBOutlet weak var edadPerroTF : UITextField!
    
    // MARK - IBActions
    @IBAction func calculoEdadPerroACTION(_ sender : UIButton) {
        self.edadPerro = Int(self.edadPerroTF.text ?? "0")
        
        if let edadPerroUnw = self.edadPerro {
            self.nuevaEdadPerro = edadPerroUnw * 7
            self.present(Utils.shared.showAlertVC(
                            title: "Edad de mi Perro",
                            message: "El calculo de la edad de mi perro es : \(self.nuevaEdadPerro ?? 0)"),
                         animated: true) {
                self.edadPerroTF.text = "\(self.nuevaEdadPerro ?? 0)"
            }
        } else {
            self.present(Utils.shared.showAlertVC(
                            title: "Estimado Usuario",
                            message: "Por favor introduce la edad de tu perro para calcularla."),
                         animated: true,
                         completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configuracionUI()
        // Do any additional setup after loading the view.
    }
    
    private func configuracionUI() {
        self.miNombreLBL.text = "Mi Nombre es : \(self.datosUsuario.nombreData ?? "")"
        self.miApellidoLBL.text = "Mi Apellido es : \(self.datosUsuario.apellidoData ?? "")"
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "segueV3" {
            
            if let edadPerro = self.nuevaEdadPerro {
                
                self.navigationToThirdWindow(segue: segue, edadPerro: edadPerro)
                
            } else {
                self.present(Utils.shared.showAlertVC(
                                title: "Heyeee",
                                message: "Por favor introduce datos en todos los campos de texto."),
                             animated: true,
                             completion: nil)
            }
        }
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    private func navigationToThirdWindow(segue: UIStoryboardSegue, edadPerro : Int) {
        
        if !(self.miTelefonoTF.text?.isEmpty ?? false) &&
            !(self.miDireccionTF.text?.isEmpty ?? false) &&
            !("\(edadPerro)".isEmpty) {
            
            let ventana3VC = segue.destination as? ThirdViewController
            ventana3VC?.datosUsuario.nombreData = self.datosUsuario.nombreData
            ventana3VC?.datosUsuario.apellidoData = self.datosUsuario.apellidoData
            ventana3VC?.datosUsuario.telefonoData = self.miTelefonoTF.text
            ventana3VC?.datosUsuario.direccionData = self.miDireccionTF.text
            ventana3VC?.datosUsuario.edadPerroData = self.edadPerroTF.text
            
        } else {
            self.present(Utils.shared.showAlertVC(
                            title: "Heyeee",
                            message: "Por favor introduce datos en todos los campos de texto."),
                         animated: true,
                         completion: nil)
        }
        
    }
}
