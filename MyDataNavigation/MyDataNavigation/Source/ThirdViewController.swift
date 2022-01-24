//
//  ThirdViewController.swift
//  MyDataNavigation
//
//  Created by cice on 20/01/2022.
//

import UIKit

class ThirdViewController: UIViewController {

    // MARK: - Variables
    var datosUsuario = DatosUsuraioModel()
    let dataSourceCodigoPostal = ["28001", "38002", "48003", "58004"]
    let dataSourceCiudad = ["Madrid", "Barcelona", "Zaragoza", "Extremadura"]
    let dataSourcePosicionGeografica = ["40.1213, -3.4321", "3.4321, -401234", "130.098, -3.1234"]
    
    // MARK: - IBOutlets
    @IBOutlet weak var miNombreLBL : UILabel!
    @IBOutlet weak var miApellidoLBL : UILabel!
    @IBOutlet weak var miTelefonoLBL : UILabel!
    @IBOutlet weak var miDireccionLBL : UILabel!
    @IBOutlet weak var edadPerroLBL : UILabel!
    @IBOutlet weak var miCodigoPostalTF: UITextField!
    @IBOutlet weak var miCiudadTF: UITextField!
    @IBOutlet weak var miPosicionGepTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configurationUI()
        self.configurationPicker()
        // Do any additional setup after loading the view.
    }
    
    private func configurationUI() {
        self.miNombreLBL.text = "Mi Nombre es : \(self.datosUsuario.nombreData ?? "")"
        self.miApellidoLBL.text = "Mi Apellido es : \(self.datosUsuario.apellidoData ?? "")"
        self.miTelefonoLBL.text = "Mi Teléfono es : \(self.datosUsuario.telefonoData ?? "")"
        self.miDireccionLBL.text = "Mi Dirección es : \(self.datosUsuario.direccionData ?? "")"
        self.edadPerroLBL.text = "La Edad de mi Perro es : \(self.datosUsuario.edadPerroData ?? "")"
    }
    
    private func configurationPicker() {
        Utils.shared.configuracionPickerView(tag: 1, delegate: self, dataSource: self, textField: self.miCodigoPostalTF)
        Utils.shared.configuracionPickerView(tag: 2, delegate: self, dataSource: self, textField: self.miCiudadTF)
        Utils.shared.configuracionPickerView(tag: 3, delegate: self, dataSource: self, textField: self.miPosicionGepTF)
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "segueV4" {
            navigationToFourthWindow(segue: segue)
        }
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    private func navigationToFourthWindow(segue: UIStoryboardSegue) {
        
        if Utils.shared.dataIntextFieldIsEmpty(param: [self.miCiudadTF.text ?? "", self.miCodigoPostalTF.text ?? "", self.miPosicionGepTF.text ?? ""]) {
            
            let ventana4VC = segue.destination as? FourthViewController
            ventana4VC?.datosUsuario.nombreData = self.datosUsuario.nombreData
            ventana4VC?.datosUsuario.apellidoData = self.datosUsuario.apellidoData
            ventana4VC?.datosUsuario.telefonoData = self.datosUsuario.telefonoData
            ventana4VC?.datosUsuario.direccionData = self.datosUsuario.direccionData
            ventana4VC?.datosUsuario.edadPerroData = self.datosUsuario.edadPerroData
            ventana4VC?.datosUsuario.codigoPostalData = self.miCodigoPostalTF.text
            ventana4VC?.datosUsuario.ciudadData = self.miCiudadTF.text
            ventana4VC?.datosUsuario.posicionGeograficaData = self.miPosicionGepTF.text
            
        } else {
            self.present(Utils.shared.showAlertVC(
                            title: "Heyeee",
                            message: "Por favor introduce datos en todos los campos de texto."),
                         animated: true,
                         completion: nil)
        }
        
    }

}

// MARK: - ThirdViewController : UIPickerViewDataSource
extension ThirdViewController : UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView : UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView.tag {
        case 1:
            return self.dataSourceCodigoPostal.count
        case 2:
            return self.dataSourceCiudad.count
        default:
            return self.dataSourcePosicionGeografica.count
        }
    }
    
}

// MARK: - ThirdViewController : UIPickerViewDelegate
extension ThirdViewController: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView.tag {
        case 1:
            return self.dataSourceCodigoPostal[row]
        case 2:
            return self.dataSourceCiudad[row]
        default:
            return self.dataSourcePosicionGeografica[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 50
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView.tag {
        case 1:
            self.miCodigoPostalTF.text = self.dataSourceCodigoPostal[row]
        case 2:
            self.miCiudadTF.text = self.dataSourceCiudad[row]
        default:
            self.miPosicionGepTF.text = self.dataSourcePosicionGeografica[row]
        }
    }
    
}
