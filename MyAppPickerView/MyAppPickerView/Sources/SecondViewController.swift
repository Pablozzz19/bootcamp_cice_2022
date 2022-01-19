//
//  SecondViewController.swift
//  MyAppPickerView
//
//  Created by cice on 19/01/2022.
//

import UIKit

class SecondViewController: UIViewController {

    // MARK: - Variables
    let dataSourceLocalidades = ["Salamanca", "La Fatina", "Muencarral", "Gentas"]
    let dataSourceCodigoPostal = ["21001", "21002", "21003", "21004"]
    let dataSourcePrioridadesTeletrabajo = ["Alta", "Media", "Baja"]
    let dataSourceFotoPerfil = ["Maria", "Felipe", "Maria", "Felipe"]

    
    // MARK: - IBDOutlets
    @IBOutlet weak var localidadesTF : UITextField!
    @IBOutlet weak var codigoPostalTF : UITextField!
    @IBOutlet weak var prioridadTrabajoTF : UITextField!
    @IBOutlet weak var perfilImageView : UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configurationUI()
    }
    

    private func configurationUI() {
        
    }

}
