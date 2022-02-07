//
//  ListaTareasCell.swift
//  MyTaskVersion3.0
//
//  Created by cice on 03/02/2022.
//

import UIKit

protocol ListaTareaCellProtocol {
    func configuracionCell(data: DownloadNewModel)
}

class ListaTareasCell: UITableViewCell, ReuseIdentifierProtocol {

    // MARK: - IBOutlets
    @IBOutlet weak var imageTareaIV: UIImageView!
    @IBOutlet weak var nombreTareaLBL: UILabel!
    @IBOutlet weak var prioridadTareaLBL: UILabel!
    @IBOutlet weak var customContentView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.configuracionUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func configuracionUI() {
        self.imageTareaIV.layer.cornerRadius = self.imageTareaIV.frame.width / 2
        self.imageTareaIV.layer.borderWidth = 1
        self.imageTareaIV.layer.borderColor = UIColor.gray.cgColor
        self.customContentView.layer.cornerRadius = 10
        self.customContentView.layer.borderWidth = 0.3
        self.customContentView.layer.borderColor = UIColor.lightGray.cgColor
        self.addShadow(customObject: self.customContentView)
    }
    
    func addShadow(customObject: UIView){
        customObject.layer.shadowColor = UIColor.black.cgColor
        customObject.layer.shadowOpacity = 0.2
        customObject.layer.shadowRadius = 10
        customObject.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
    }
    
}

extension ListaTareasCell: ListaTareaCellProtocol {
    func configuracionCell(data: DownloadNewModel) {
        self.imageTareaIV.image = UIImage(data: (data.taskImage!))
        self.nombreTareaLBL.text = data.newTask
        self.prioridadTareaLBL.text = data.priority
    }
}
