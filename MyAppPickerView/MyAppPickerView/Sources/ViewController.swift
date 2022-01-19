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
    }
    
    // MARK: - Metodos privados
    private func configurationUI() {
        self.title = "Queso del Mundo"
        //self.tituloQuesoLbl.text = self.quesosArrayData[0]
        self.tituloQuesoLbl.text = self.quesosArrayData.first
        self.detalleTextQuesoTxv.text = "La mozzarella1 (del italiano antiguo mozzare ‘cortar’) es un tipo de queso originario de la cocina italiana. Existe una variante de este queso en Dinamarca, pero la tradición italiana es más antigua. La ciudad de origen de este queso fue Aversa (Caserta). La denominación de origen con protección europea es la Mozzarella di Bufala Campana, sin que haya solicitado Italia la protección del nombre mozzarella. El queso DOP se produce en las provincias de Caserta y Salerno y en algunos municipios de las provincias de Nápoles, Benevento, Latina y Foggia con leche de búfala. En la misma Italia y en otros países, como Argentina, Colombia, España, Paraguay, Perú, República Dominicana, Uruguay, se preparan mozzarellas con leche de vaca."
        //self.imageQuesoImv.image = UIImage(named: self.quesosArrayData[0])
        self.imageQuesoImv.image = UIImage(named: self.quesosArrayData.first ?? "placeholder")
    }
		
}

