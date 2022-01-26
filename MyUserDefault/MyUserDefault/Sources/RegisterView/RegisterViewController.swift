//
//  RegisterViewController.swift
//  MyUserDefault
//
//  Created by cice on 26/01/2022.
//

import UIKit

class RegisterViewController: UIViewController {

    // MARK: - Variables globales
    var existeFoto = false
    var usuarioLogado = false
    
    // MARK: - IBOutlets
    @IBOutlet weak var nombreTF: UITextField!
    @IBOutlet weak var apellidoTF: UITextField!
    @IBOutlet weak var direccionTF: UITextField!
    @IBOutlet weak var telefonoTF: UITextField!
    @IBOutlet weak var imagenPerfilTF: UIImageView!
    @IBOutlet weak var fechaActualizacionLBL: UILabel!
    
    // MARK: - IBActions
    @IBAction func guardarDatosACTION(_ sender: Any) {
    }
    
    @IBAction func recuperarDatosACTION(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
