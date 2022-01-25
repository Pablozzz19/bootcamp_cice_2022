//
//  CochesCell.swift
//  MyAppIntroductionTableView
//
//  Created by cice on 24/01/2022.
//

import UIKit

protocol CochesCellProtocol {
    func setuptCell(data: CochesModel?)
}

class CochesCell: UITableViewCell, ReuseIdentifierView {

    // MARK: - IBOutlets
    @IBOutlet weak var miCocheImageView: UIImageView!
    @IBOutlet weak var miNombreCocheLBL: UILabel!
    @IBOutlet weak var miColorCocheLBL: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension CochesCell: CochesCellProtocol {
    func setuptCell(data: CochesModel?) {
        self.miNombreCocheLBL.text = data?.nombre
        self.miColorCocheLBL.text = data?.color
        self.miCocheImageView.image = data?.imagen
    }
}
