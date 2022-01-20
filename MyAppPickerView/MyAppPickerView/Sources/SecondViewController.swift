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
        self.perfilImageView.image = UIImage(named: self.dataSourceFotoPerfil[0] ?? "placeholder")
        Utils.shared.configurationPickerView(tag: 1,
                                             delegate: self,
                                             datasource: self,
                                             textField: self.localidadesTF,
                                             dataArray: self.dataSourceLocalidades)
        Utils.shared.configurationPickerView(tag: 2,
                                             delegate: self,
                                             datasource: self,
                                             textField: self.codigoPostalTF,
                                             dataArray: self.dataSourceCodigoPostal)
        Utils.shared.configurationPickerView(tag: 3,
                                             delegate: self,
                                             datasource: self,
                                             textField: self.prioridadTrabajoTF,
                                             dataArray: self.dataSourcePrioridadesTeletrabajo)
    }       

}

extension SecondViewController : UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView.tag {
        case 1:
            return self.dataSourceLocalidades[row]
        case 2:
            return self.dataSourceCodigoPostal[row]
        default:
            return self.dataSourcePrioridadesTeletrabajo[row]
        }

    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 50
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView.tag {
        case 1:
            self.localidadesTF.text = self.dataSourceLocalidades[row]
        case 2:
            self.codigoPostalTF.text = self.dataSourceCodigoPostal[row]
        default:
            self.prioridadTrabajoTF.text = self.dataSourcePrioridadesTeletrabajo[row]
            self.perfilImageView.image = UIImage(named: self.dataSourceFotoPerfil[row])
        }
    }
    
}

extension SecondViewController : UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView : UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView.tag {
        case 1:
            return self.dataSourceLocalidades.count
        case 2:
            return self.dataSourceCodigoPostal.count
        default:
            return self.dataSourcePrioridadesTeletrabajo.count
        }
    }
}
