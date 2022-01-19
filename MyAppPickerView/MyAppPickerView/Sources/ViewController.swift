//
//  ViewController.swift
//  MyAppPickerView
//
//  Created by cice on 19/01/2022.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Variables globales
    let quesosArrayData = ["Mozzarella", "Gorgonzola", "Provolone", "Stilton", "Asiago"]
    
    // MARK: - IBOutlets
    @IBOutlet weak var tituloQuesoLbl : UILabel!
    @IBOutlet weak var detalleTextQuesoTxv : UITextView!
    @IBOutlet weak var imageQuesoImv : UIImageView!
    @IBOutlet weak var pickerQuesoPickV : UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configurationUI()
        self.configurationPickerView()
    }
    
    // MARK: - Metodos privados
    private func configurationUI() {
        self.title = "Quesos del Mundo"
        //self.tituloQuesoLbl.text = self.quesosArrayData[0]
        self.tituloQuesoLbl.text = self.quesosArrayData.first
        //self.imageQuesoImv.image = UIImage(named: self.quesosArrayData[0])
        self.imageQuesoImv.image = UIImage(named: self.quesosArrayData.first ?? "placeholder")
        
        self.detalleTextQuesoTxv.text = "La Mozzarella (del italiano antiguo mozzare ‘cortar’) es un tipo de queso originario de la cocina italiana. Existe una variante de este queso en Dinamarca, pero la tradición italiana es más antigua. La ciudad de origen de este queso fue Aversa (Caserta). La denominación de origen con protección europea es la Mozzarella di Bufala Campana, sin que haya solicitado Italia la protección del nombre mozzarella. El queso DOP se produce en las provincias de Caserta y Salerno y en algunos municipios de las provincias de Nápoles, Benevento, Latina y Foggia con leche de búfala. En la misma Italia y en otros países, como Argentina, Colombia, España, Paraguay, Perú, República Dominicana, Uruguay, se preparan mozzarellas con leche de vaca."
    }
    
    private func configurationPickerView() {
        self.pickerQuesoPickV.delegate = self
        self.pickerQuesoPickV.dataSource = self
    }
		
}

// MARK: - extension -> UIPickerViewDelegate
extension ViewController : UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.quesosArrayData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 50
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        self.tituloQuesoLbl.text = self.quesosArrayData[row]
        self.imageQuesoImv.image = UIImage(named: self.quesosArrayData[row])
        
        switch row {
        case 0:
            self.detalleTextQuesoTxv.text = "La Mozzarella (del italiano antiguo mozzare ‘cortar’) es un tipo de queso originario de la cocina italiana. Existe una variante de este queso en Dinamarca, pero la tradición italiana es más antigua. La ciudad de origen de este queso fue Aversa (Caserta). La denominación de origen con protección europea es la Mozzarella di Bufala Campana, sin que haya solicitado Italia la protección del nombre mozzarella. El queso DOP se produce en las provincias de Caserta y Salerno y en algunos municipios de las provincias de Nápoles, Benevento, Latina y Foggia con leche de búfala. En la misma Italia y en otros países, como Argentina, Colombia, España, Paraguay, Perú, República Dominicana, Uruguay, se preparan mozzarellas con leche de vaca."
        case 1:
            self.detalleTextQuesoTxv.text = "La Gorgonzola (del italiano antiguo mozzare ‘cortar’) es un tipo de queso originario de la cocina italiana. Existe una variante de este queso en Dinamarca, pero la tradición italiana es más antigua. La ciudad de origen de este queso fue Aversa (Caserta). La denominación de origen con protección europea es la Mozzarella di Bufala Campana, sin que haya solicitado Italia la protección del nombre mozzarella. "
        case 2:
            self.detalleTextQuesoTxv.text = "La Provolone (del italiano antiguo mozzare ‘cortar’) es un tipo de queso originario de la cocina italiana. Existe una variante de este queso en Dinamarca, pero la tradición italiana es más antigua. "
        case 3:
            self.detalleTextQuesoTxv.text = "La Stilton (del italiano antiguo mozzare ‘cortar’) es un tipo de queso originario de la cocina italiana. Existe una variante de este queso en Dinamarca, pero la tradición italiana es más antigua. La ciudad de origen de este queso fue Aversa (Caserta). La denominación de origen con protección europea es la Mozzarella di Bufala Campana, sin que haya solicitado Italia la protección del nombre mozzarella. El queso DOP se produce en las provincias de Caserta y Salerno y en algunos municipios de las provincias de Nápoles, Benevento, Latina y Foggia con leche de búfala. "
        default:
            self.detalleTextQuesoTxv.text = "La Asiago (del italiano antiguo mozzare ‘cortar’) es un tipo de queso originario de la cocina italiana. Existe una variante de este queso en Dinamarca, pero la tradición italiana es más antigua. La ciudad de origen de este queso fue Aversa (Caserta). La denominación de origen con protección europea es la Mozzarella di Bufala Campana, sin que haya solicitado Italia la protección del nombre mozzarella."
        }
    }
    
}

// MARK: - extension -> UIPickerViewDataSource
extension ViewController : UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.quesosArrayData.count
    }
    
}
