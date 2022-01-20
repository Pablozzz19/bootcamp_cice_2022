//
//  FirstViewController.swift
//  MyDataNavigation
//
//  Created by cice on 20/01/2022.
//

import UIKit

class FirstViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var miNombreTF : UITextField!
    @IBOutlet weak var miApellidoTF : UITextField!
    
    @IBAction func muestraSegundaVentanaAction(_ sender : UIButton) {
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "segueV2" {
            
            if !(self.miNombreTF.text?.isEmpty ?? false) && !(self.miApellidoTF.text?.isEmpty ?? false) {
                
                let ventana2VC = segue.destination as? SecondViewController
                ventana2VC?.datosUsuario.nombreData = self.miNombreTF.text
                ventana2VC?.datosUsuario.apellidoData = self.miApellidoTF.text
                
            } else {
                // Una alerta que el usuario debe rellenar los datos.
                self.present(Utils.shared.showAlertVC(
                                title: "Estimado Usuario",
                                message: "Debes rellenar los campos para continuar"),
                             animated: true,
                             completion: nil)
            }
            
        }
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

}
