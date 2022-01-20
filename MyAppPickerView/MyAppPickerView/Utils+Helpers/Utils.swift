//
//  Utils.swift
//  MyAppPickerView
//
//  Created by cice on 20/01/2022.
//

import Foundation
import UIKit

class Utils {
    
    // Patron Singleton.
    static let shared = Utils()
    
    func configurationPickerView(tag : Int,
                                 delegate : UIPickerViewDelegate,
                                 datasource : UIPickerViewDataSource,
                                 textField : UITextField,
                                 dataArray : [String]) {
        
        let pickerView = UIPickerView()
        pickerView.delegate = delegate
        pickerView.dataSource = datasource
        pickerView.tag = tag
        textField.inputView = pickerView
        textField.text = dataArray[0]
        
    }
    
}
